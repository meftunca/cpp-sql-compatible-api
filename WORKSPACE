
workspace(name = "starter_workspace")
load("@//conandeps:dependencies.bzl", "load_conan_dependencies")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load_conan_dependencies()

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BAZEL_TOOLCHAIN_TAG = "0.7.2"

BAZEL_TOOLCHAIN_SHA = "f7aa8e59c9d3cafde6edb372d9bd25fb4ee7293ab20b916d867cd0baaa642529"


http_archive(
    name = "com_grail_bazel_toolchain",
    canonical_id = BAZEL_TOOLCHAIN_TAG,
    sha256 = BAZEL_TOOLCHAIN_SHA,
    strip_prefix = "bazel-toolchain-{tag}".format(tag = BAZEL_TOOLCHAIN_TAG),
    url = "https://github.com/grailbio/bazel-toolchain/archive/{tag}.tar.gz".format(tag = BAZEL_TOOLCHAIN_TAG),
)

http_archive(
    name = "com_grail_bazel_compdb",
    strip_prefix = "bazel-compilation-database-0.5.2",
    urls = ["https://github.com/grailbio/bazel-compilation-database/archive/0.5.2.tar.gz"],
)

# Google Test framework, used by most unit-tests.

git_repository(
    name = "com_google_googletest",
    #// Dec 27, 2021
    commit = "58d77fa8070e8cec2dc1ed015d66b454c8d78850",
    remote = "https://github.com/google/googletest",
    # tag = "release-1.11.0",
)
# Google Benchmark library, used in micro-benchmarks.
git_repository(
    name = "benchmark",
    #// Dec 27, 2021
    commit = "361e8d1cfe0c6c36d30b39f1b61302ece5507320",
    remote = "https://github.com/google/benchmark.git",
    # tag = "release-1.11.0",
)

load("@com_grail_bazel_toolchain//toolchain:deps.bzl", "bazel_toolchain_dependencies")

bazel_toolchain_dependencies()

load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "14.0.0",
    # cxx_standard = 20,
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")

llvm_register_toolchains()

load("@com_grail_bazel_compdb//:deps.bzl", "bazel_compdb_deps")

bazel_compdb_deps()
