// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "MarsRover",
    products: [
        .library(
            name: "MarsRover",
            targets: ["MarsRover"]),
    ],
    targets: [
        .target(
            name: "MarsRover",
            dependencies: [],
            path: "Sources/MarsRover"),
        .testTarget(
            name: "MarsRoverTests",
            dependencies: ["MarsRover"],
            path: "Tests/MarsRoverTests"),
    ]
)
