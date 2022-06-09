// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CX",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AppHome",
            targets: ["AppHome"]),
    ],
    dependencies: [
        .package(url: "https://github.com/uber/RIBs",  branch: "main"),
        .package( url: "https://github.com/layoutBox/PinLayout", branch: "master"),
        .package( url: "https://github.com/RxSwiftCommunity/RxRealm", branch: "main"),
        .package( url: "https://github.com/ReactiveX/RxSwift", branch: "main"),
        .package(url: "https://github.com/devxoul/Then", branch: "master"),
        .package( url: "https://github.com/JiHoonAHN/PageImageScrollView", branch: "main"),
        .package(path: "../Platform"),
        .package(path: "../RxRealmDataSources"),
        .package(path: "../ChooseImage")
    ],
    targets: [
        .target(
            name: "AppHome",
            dependencies: [
                "RIBs",
                "PinLayout",
                "PageImageScrollView",
                "RxRealm",
                "RxSwift",
                "Then",
                .product(name: "RxRealmDataSources", package: "RxRealmDataSources"),
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "RIBsUtil", package: "Platform"),
                .product(name: "ImageVerification", package: "ChooseImage"),
                .product(name: "ImageRepository", package: "ChooseImage"),
                .product(name: "ImageEntity", package: "ChooseImage"),
                .product(name: "ChooseImage", package: "ChooseImage"),
            ],
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
