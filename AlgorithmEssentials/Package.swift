// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlgorithmEssentials",
    products: [
        .library(
            name: "AlgorithmEssentials",
            targets: ["AlgorithmEssentials"]),
    ],
    targets: [
        .target(
            name: "AlgorithmEssentials"),
        .testTarget(
            name: "AlgorithmEssentialsTests",
            dependencies: ["AlgorithmEssentials"]),
    ]
)
