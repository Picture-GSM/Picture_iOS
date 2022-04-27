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
            name: "ChooseImageImp",
            targets: ["ChooseImageImp"]),
        .library(
            name: "Loading",
            targets: ["Loading"]),
        .library(
            name: "LoadingImp",
            targets: ["LoadingImp","PytorchModule"]),
        .library(
            name: "ImageVerification",
            targets: ["ImageVerification"]),
        .library(
            name: "ImageVerificationImp",
            targets: ["ImageVerificationImp"]),
        .library(
            name: "ImageRepository",
            targets: ["ImageRepository"]),
        .library(
            name: "ImageEntity",
            targets: ["ImageEntity"]),
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
        .target(
            name: "ChooseImage",
            dependencies: [
                "RIBs"
            ]
        ),
        .target(
            name: "ChooseImageImp",
            dependencies: [
                "Loading",
                "ImageVerification",
                "ImageRepository",
                "RxSwift",
                "Then",
                "PinLayout",
                "RIBs",
                "ImageVerificationImp",
                "ChooseImage",
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "RIBsUtil", package: "Platform"),
                .product(name: "Base", package: "Platform"),
            ]
        ),
        .target(
            name: "Loading",
            dependencies: [
                "RIBs",
            ]
        ),
        .target(
            name: "LoadingImp",
            dependencies: [
                "NVActivityIndicatorView",
                "RxSwift",
                "Then",
                "PytorchModule",
                "PinLayout",
                "RIBs",
                "Loading",
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "Base", package: "Platform"),
            ],
            path: "Sources/LoadingImp"
        ),
        .target(
            name: "PytorchModule",
            publicHeadersPath: "TorchBridge/Include",
            linkerSettings: [
                .linkedFramework("LibTorch"),
            ]
        ),
        .target(
            name: "ImageVerification",
            dependencies: [
                "RIBs",
            ]
        ),
        .target(
            name: "ImageVerificationImp",
            dependencies: [
                "RxSwift",
                "ImageRepository",
                "Then",
                "PinLayout",
                "RIBs",
                "RxRealm",
                "ImageVerification",
                .product(name: "Base", package: "Platform"),
                .product(name: "UIUtil", package: "Platform"),
            ]
        ),
        .target(
            name: "ImageEntity",
            dependencies: [
                "RxSwift",
                "RxRealm"
            ]
        ),
        .target(
            name: "ImageRepository",
            dependencies: [
                "ImageEntity",
                "RxSwift",
                "RxRealm"
            ]
        ),
    ]
)
