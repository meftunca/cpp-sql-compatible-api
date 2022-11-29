# Copyright (C)  2022 devloops
# Use of this software is govered by the Business Source License included in the LICENSE.TXT file and at www.mariadb.com/bsl11.
#
# Change Date:
#
# On the date above, in accordance with the Business Source License, use of this software will be governed by the open source license specified in the LICENSE.TXT file.

STARTUP_FLAGS= --host_jvm_args=-javaagent:$(BAZEL)/third_party/allocation_instrumenter/java-allocation-instrumenter-3.0.1.jar --host_jvm_args=-DRULE_MEMORY_TRACKER=1
TIMESTAMP = $(date +%Y%m%d_%H-%M-%S)
create-certificate:
	openssl req -x509 -newkey rsa:2048 -keyout src/socket/cert/key.pem -out src/socket/cert/cert.pem -days 30

conan-build-debug:
	conan install . -s build_type=Debug --build missing --install-folder=conandeps
conan-build-release:
	conan install . -s compiler.version=13.1 -s build_type=Release --build missing --install-folder=conandeps
build:
	bazel build --cxxopt='-std=c++17' //src:pack --spawn_strategy=local -c opt --copt=-O3 --cxxopt=-O3
	chmod 777 bazel-bin/src/pack
clean:
	bazel clean --expunge
run:
	make build
	bazel-bin/src/pack
debug:
	export pack_DATA=$(PWD)/Data
	bazel build --cxxopt='-std=c++17'  -c dbg --spawn_strategy=local -s //src:pack
	chmod 777 bazel-bin/src/pack
debug-run:
	make debug
	bazel-bin/src/pack
build-run:
	make build
	make run
visualize:
	bazel query 'deps(//:pack)' --output graph > graph.in
memory-profiling:
# 	bazel $(STARTUP_FLAGS) build --nobuild //src:pack
#   bazel $(STARTUP_FLAGS) info used-heap-size-after-gc
# 	bazel $(STARTUP_FLAGS) dump --skylark_memory=$HOME/prof.gz
#   pprof -text -lines $HOME/prof.gz
perf-profiling:
	bazel build --cxxopt='-std=c++17' //src:pack --spawn_strategy=local -c opt --copt=-O3 --cxxopt=-O3 --profile=/tmp/prof
	bazel analyze-profile /tmp/prof
analyze-profiling:
	bazel build --cxxopt='-std=c++17'  --profile=/tmp/prof //src:pack --test_env=WORKDIR=$(PWD)/Data --spawn_strategy=local
	bazel analyze-profile /tmp/prof

test:
	bazel test --cxxopt='-std=c++17' --config debug  --test_output=all --test_arg=--verbose //tests:testing --test_env=WORKDIR=$(PWD)/Data --spawn_strategy=local
bench:
	bazel build --cxxopt='-std=c++17' //benchmark:bench_test --action_env=WORKDIR=$(PWD)/Data --spawn_strategy=local -c opt --copt=-O3 --cxxopt=-O3
	bazel-bin/benchmark/bench_test --benchmark_counters_tabular=true --benchmark_format=console --benchmark_out="benchmark/benchmark__$(TIMESTAMP).json" --benchmark_out_format=json