// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QuotesModules",  // ← Package name (not a product)
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "QuotesCore", targets: ["QuotesCore"]),
        .library(name: "QuotesData", targets: ["QuotesData"]),
        .library(name: "QuotesUI", targets: ["QuotesUI"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "QuotesCore", dependencies: []),
        .target(name: "QuotesData", dependencies: ["QuotesCore"]),
        .target(name: "QuotesUI", dependencies: ["QuotesCore", "QuotesData"])
    ]
)
