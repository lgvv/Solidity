// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "lgvv-datastructure",
    products: [
        .library(
            name: "lgvv-datastructure",
            targets: ["lgvv-datastructure"]),
    ],
    targets: [
        .target(
            name: "lgvv-datastructure"),
        .testTarget(
            name: "lgvv-datastructureTests",
            dependencies: ["lgvv-datastructure"]),
    ]
)
