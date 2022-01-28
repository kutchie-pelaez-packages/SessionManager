// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "SessionManager",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: "SessionManager", targets: ["SessionManager"])
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core", .branch("master"))
    ],
    targets: [
        .target(
            name: "SessionManager",
            dependencies: [
                .product(name: "Core", package: "Core")
            ],
            path: "Sources"
        )
    ]
)
