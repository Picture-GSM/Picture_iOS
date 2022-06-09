// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "List",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ListHome",
            targets: ["ListHome"]),
        .library(
            name: "ListHomeImp",
            targets: ["ListHomeImp"]),
    ],
    dependencies: [
        .package( url: "https://github.com/uber/RIBs", branch: "main"),
        .package( url: "https://github.com/layoutBox/PinLayout", branch: "master"),
        .package( url: "https://github.com/RxSwiftCommunity/RxRealm", branch: "main"),
        .package(url: "https://github.com/ReactiveX/RxSwift", branch: "main"),
        .package(url: "https://github.com/devxoul/Then", branch: "master"),
        .package(path: "../Platform"),
        .package(path: "../RxRealmDataSources"),
        .package(path: "../ChooseImage")
    ],
    targets: [
        .target(
            name: "ListHome",
            dependencies: [
                "RIBs"
            ]
        ),
        .target(
            name: "ListHomeImp",
            dependencies: [
                "RIBs",
                "PinLayout",
                "RxRealm",
                "RxSwift",
                "Then",
                "ListHome",
                .product(name: "RxRealmDataSources", package: "RxRealmDataSources"),
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "RIBsUtil", package: "Platform"),
                .product(name: "ImageVerification", package: "ChooseImage"),
                .product(name: "ImageRepository", package: "ChooseImage"),
                .product(name: "ImageEntity", package: "ChooseImage"),
            ]
        ),
    ]
)
