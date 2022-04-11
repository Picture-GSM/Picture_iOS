// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChooseImage",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ChooseImage",
            targets: ["ChooseImage"]),
        .library(
            name: "Loading",
            targets: ["Loading"]),
        .library(
            name: "ImageVerification",
            targets: ["ImageVerification"]),
        .library(
            name: "ImageRepository",
            targets: ["ImageRepository"]),
    ],
    dependencies: [
        .package(name: "RIBs", url: "https://github.com/uber/RIBs", .exactItem("0.10.0")),
        .package(name: "PinLayout", url: "https://github.com/layoutBox/PinLayout", .exactItem("1.10.2")),
        .package(name: "RxRealm", url: "https://github.com/RxSwiftCommunity/RxRealm", .exactItem("5.0.5")),
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift", .exactItem("6.5.0")),
        .package(name: "Then", url: "https://github.com/devxoul/Then", .exactItem("2.7.0")),
        .package(name: "NVActivityIndicatorView", url: "https://github.com/ninjaprox/NVActivityIndicatorView",  .exactItem("5.1.1")),
        .package(path: "../Platform"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ChooseImage",
            dependencies: [
                "Loading",
                "ImageVerification",
                "ImageRepository",
                "RxSwift",
                "Then",
                "PinLayout",
                "RIBs",
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "RIBsUtil", package: "Platform"),
                .product(name: "Base", package: "Platform"),
            ]
        ),
        .target(
            name: "Loading",
            dependencies: [
                "NVActivityIndicatorView",
                "RxSwift",
                "Then",
                "PinLayout",
                "RIBs",
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "Base", package: "Platform"),

            ]
        ),
        .target(
            name: "ImageVerification",
            dependencies: [
                "RxSwift",
                "ImageRepository",
                "Then",
                "PinLayout",
                "RIBs",
                "RxRealm",
                .product(name: "Base", package: "Platform"),

            ]
        ),
        .target(
            name: "ImageRepository",
            dependencies: [
                "RxSwift",
                "RxRealm"
            ]
        ),
    ]
)
