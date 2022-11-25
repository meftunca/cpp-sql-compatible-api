
cc_test(
    name = "testing",
    # srcs = ["main_test.cc","create_or_append_collection_test.cc"],
    srcs = glob(["**/*.cc"]),
    deps = [
        # "@gtest",
        "@com_google_googletest//:gtest_main",
        "@date",
        "@fmt",
        "@zstd",
        # "@lz4",
        # "@snappy",
        "@spdlog",
        "@taocpp-pegtl",
        "@taocpp-json",
        "//externals:faker",
    ],
    visibility = ["//visibility:public"],
    # copts = ["-Iexternal/llvm/include"],
    # linkopts = ["-Lexternal/llvm/lib","-lexternals"],
)
