licenses(["notice"])


cc_library(
    name = "CFHolder",
    # Header is excluded on non-ios so you can still build :all.
    hdrs = select({
        ":apple": ["CFHolder.h"],
        "//conditions:default": [],
    }),
    features = ["layering_check"],
)

cc_library(
    name = "hello-greet",
    srcs = ["hello-greet.cc"],
    hdrs = ["hello-greet.h"],
    deps = [
        ":CFHolder"
    ],
    features = [
        "-parse_headers",
        "layering_check",
    ],
)

cc_library(
    name = "hello-greet-cpu",
    srcs = ["hello-greet-cpu.c"],
    hdrs = ["hello-greet.h"],
)

cc_library(
    name = "angle",
    hdrs = glob(["libangle/include/**/*.h"]),
    includes = ["libangle/include"],
    srcs = glob(
        [
            "libangle/*.dylib",
        ],
    ),
    # include_prefix = "main/libangle/include",
    # copts = ["-I./include"],
    linkopts = [
        "-lEGL",
        "-lGLESv2",
    ],
    visibility = ["//visibility:public"],
)


cc_library(
    name = "girl",
    hdrs = ["girl.h"],
    
    visibility = ["//visibility:public"],
    deps = [
        ":angle",
        "//third_party:opencv",
    ],
)

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    deps = [
        ":girl",
    ] + select({
        ":apple" : [":hello-greet"],
        "//conditions:default" : [":hello-greet-cpu"]
    }),
    linkstatic = 0
)

apple_binary(
    name = "libmediapipe.dylib",
    # linkstatic = True,
    # linkshared = True,
    binary_type = "dylib",
    platform_type = "macos",
    visibility = ["//visibility:public"],
    deps = [
        ":linkv_graph"
    ],
)

objc_library(
    name = "linkv_graph",
    srcs = ["linkv_graph.mm"],
    hdrs = ["linkv_graph.h"],
    # copts = [
    #     "-x objective-c++",
    #     "-fobjc-arc",  # enable reference-counting
    # ],
    visibility = ["//visibility:public"],
    # linkstatic = 1,

    # 该属性打开，标识所有使用到该库的都有使用静态方式进行链接，即使没有使用到的方法也会链接进去
    alwayslink = 1,
)

config_setting(
    name = "macos_x86_64",
    values = { "cpu": "darwin_x86)" }
)

config_setting(
    name = "macos_arm64",
    values = { "cpu": "darwin_arm64" }
)

# Note: this cannot just match "apple_platform_type": "macos" because that option
# defaults to "macos" even when building on Linux!
alias(
    name = "macos",
    actual = select({
        ":macos_x86_64": ":macos_x86_64",
        ":macos_arm64": ":macos_arm64",
        "//conditions:default": ":macos_x86_64",  # Arbitrarily chosen from above.
    }),
    visibility = ["//visibility:public"],
)

[
    config_setting(
        name = arch,
        values = {"cpu": arch},
        visibility = ["//visibility:public"],
    )
    for arch in [
        "ios_i386",
        "ios_x86_64",
        "ios_armv7",
        "ios_arm64",
        "ios_arm64e",
    ]
]

config_setting(
    name = "ios",
    values = {
        "crosstool_top": "@bazel_tools//tools/cpp:toolchain",
        "apple_platform_type": "ios",
    },
    visibility = ["//visibility:public"],
)

alias(
    name = "apple",
    actual = select({
        ":macos": ":macos",
        ":ios": ":ios",
        "//conditions:default": ":ios",  # Arbitrarily chosen from above.
    }),
    visibility = ["//visibility:public"],
)