// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Platform",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "UIUtil",
            targets: ["UIUtil"]),
        .library(
            name: "RxUtil",
            targets: ["RxUtil"]),
        .library(
            name: "RIBsUtil",
            targets: ["RIBsUtil"]),
        .library(
            name: "FoundationUtil",
            targets: ["FoundationUtil"]),
        .library(
            name: "Base",
            targets: ["Base"]),
    ],
    dependencies: [
        .package(url: "https://github.com/uber/RIBs", branch: "main"),
        .package(url: "https://github.com/ReactiveX/RxSwift",branch: "main"),
    ],
    targets: [
        .target(
            name: "UIUtil",
            dependencies: [
                "RIBsUtil"
            ]),
        .target(
            name: "RxUtil",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift")
            ]),
        .target(
            name: "RIBsUtil",
            dependencies: [
                "RIBs"
            ]),
        .target(
            name: "FoundationUtil",
            dependencies: [ ]),
        .target(
            name: "Base",
            dependencies: [
                "RxSwift"
            ]
        ),
    ]
)
