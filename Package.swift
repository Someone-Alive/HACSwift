// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HAC-Swift",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HAC-Swift",
            targets: ["HAC-Swift"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/scinfu/SwiftSoup.git",
            .upToNextMajor(from: "2.7.5")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HAC-Swift",
            dependencies: ["SwiftSoup"]
        ),

    ]
)
