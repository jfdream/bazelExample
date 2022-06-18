# Description:
#   OpenCV libraries for video/image processing on MacOS

licenses(["notice"])  # BSD license

exports_files(["LICENSE"])

load("@bazel_skylib//lib:paths.bzl", "paths")

# The path to OpenCV is a combination of the path set for "macos_opencv"
# in the WORKSPACE file and the prefix here.
PREFIX = "opt/libangle"

cc_library(
    name = "angle",
    srcs = glob(
        [
            paths.join(PREFIX, "lib/libGLESv2.dylib"),
            paths.join(PREFIX, "lib/libEGL.dylib"),
        ],
    ),
    hdrs = glob([paths.join(PREFIX, "include/**/*.h")]),

    includes = [paths.join(PREFIX, "include")],
    linkstatic = 0,
    visibility = ["//visibility:public"],
)
