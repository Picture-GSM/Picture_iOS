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
            targets: ["LoadingImp"]),
        .library(
            name: "LoadingRepository",
            targets: ["LoadingRepository"]),
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
        .package(url: "https://github.com/uber/RIBs", branch: "main"),
        .package(url: "https://github.com/layoutBox/PinLayout", branch: "master"),
        .package( url: "https://github.com/RxSwiftCommunity/RxRealm", branch: "main"),
        .package(url: "https://github.com/ReactiveX/RxSwift", branch: "main"),
        .package( url: "https://github.com/devxoul/Then", branch: "master"),
        .package(url: "https://github.com/ninjaprox/NVActivityIndicatorView",  branch: "master"),
        .package(path: "../Platform"),
    ],
    targets: [
        .target(
            name: "LoadingRepository",
            dependencies: [
                
            ],
            resources: [
                .process("CoreML/style_transfer.mlmodel")
            ]
        ),
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
                "LoadingRepository",
                "NVActivityIndicatorView",
                "RxSwift",
                "Then",
                "PinLayout",
                "RIBs",
                "Loading",
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "Base", package: "Platform"),
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
