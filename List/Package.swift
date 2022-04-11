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
        .package(name: "RIBs", url: "https://github.com/uber/RIBs", .exactItem("0.10.0")),
        .package(name: "PinLayout", url: "https://github.com/layoutBox/PinLayout", .exactItem("1.10.2")),
        .package(name: "RxRealm", url: "https://github.com/RxSwiftCommunity/RxRealm", .exactItem("5.0.5")),
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift", .exactItem("6.5.0")),
        .package(name: "Then", url: "https://github.com/devxoul/Then", .exactItem("2.7.0")),
        .package(path: "../Platform"),
        .package(path: "../RxRealmDataSources"),
        .package(path: "../ChooseImage")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
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
            ],
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
