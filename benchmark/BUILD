
load("@rules_cc//cc:defs.bzl", "cc_binary")
package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "benchmark",
    # srcs = ["main.cc"],
    # hdrs = ["hello-time.h"],
    srcs = glob(["*.cc","**/*.cc"]),
    deps = [
        "@benchmark",
        "@spdlog",
        "@date",
        "@fmt",
        "@zstd",
        # "@lz4",
        # "@snappy",
        "//externals:faker",
        "@taocpp-pegtl",
        "@taocpp-json",
    ]
)