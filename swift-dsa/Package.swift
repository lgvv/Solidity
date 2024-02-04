// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-dsa",
    products: [
        .library(
            name: "DataStructureEssentials",
            targets: ["DataStructureEssentials"]),
    ],
    targets: [
        .target(
            name: "DataStructureEssentials"),
        .testTarget(
            name: "DataStructureEssentialsTests",
            dependencies: ["DataStructureEssentials"]),
    ]
)
