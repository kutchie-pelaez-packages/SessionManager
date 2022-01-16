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
        .package(name: "CoreUtils", url: "https://github.com/kutchie-pelaez/CoreUtils", .branch("master"))
    ],
    targets: [
        .target(
            name: "SessionManager",
            dependencies: [
                .product(name: "CoreUtils", package: "CoreUtils")
            ],
            path: "Sources"
        )
    ]
)
