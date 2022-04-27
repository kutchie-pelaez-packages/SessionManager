// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "SessionManager",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(
            name: "SessionManagerImpl",
            targets: [
                "SessionManagerImpl"
            ]
        ),
        .library(
            name: "SessionManager",
            targets: [
                "SessionManager"
            ]
        ),
        .library(
            name: "SessionTweaking",
            targets: [
                "SessionTweaking"
            ]
        )
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core.git", .branch("master")),
        .package(name: "Tweaking", url: "https://github.com/kutchie-pelaez-packages/Tweaking.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "SessionManagerImpl",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "Tweaking", package: "Tweaking"),
                .target(name: "SessionManager"),
                .target(name: "SessionTweaking")
            ]
        ),
        .target(
            name: "SessionManager",
            dependencies: [
                .product(name: "Core", package: "Core")
            ]
        ),
        .target(
            name: "SessionTweaking",
            dependencies: [
                .product(name: "Tweaking", package: "Tweaking")
            ]
        )
    ]
)
