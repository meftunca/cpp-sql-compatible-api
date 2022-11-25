# Copyright (C)  2022 devloops
# Use of this software is govered by the Business Source License included in the LICENSE.TXT file and at www.mariadb.com/bsl11.
#
# Change Date:
#
# On the date above, in accordance with the Business Source License, use of this software will be governed by the open source license specified in the LICENSE.TXT file.

load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "faker",
    srcs = glob(["faker/*.cpp"]),
    hdrs = glob(["faker/*.h"]),
    deps = [
        "@date",
        "@nlohmann_json"
        ],
    visibility = ["//visibility:public"],
)
