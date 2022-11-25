
#include <benchmark/benchmark.h>
#include <iostream>

#define MEMORY_PROFILER 1

static void HelloWorld(benchmark::State &state) {
  std::string helloWorld = "Hello World";
  auto size = helloWorld.size();
  try {
    // tao::json::value array = tao::json::value::array({});
    for (auto _ : state) {
      std::cout << helloWorld << std::endl;
    }
    state.SetItemsProcessed(state.iterations() * size);
    state.SetBytesProcessed(state.iterations() * size);
    // array.clear();
  } catch (std::exception &e) {
    std::cout << e.what() << "\n\n";
  }
}

// BENCHMARK(HelloWorld)->Name("HelloWorld Multi Thread")->ThreadPerCpu();

BENCHMARK_MAIN();
