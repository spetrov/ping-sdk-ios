// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Orchestrate-iOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingOrchestrate", targets: ["PingOrchestrate"])
    ],
    dependencies: [
        .package(name: "PingLogger", url: "https://github.com/spetrov/ping-logger-spetrov", .upToNextMinor(from: "2.0.0")),
        .package(name: "PingStorage", url: "https://github.com/spetrov/ping-storage-spetrov", .upToNextMinor(from: "2.0.0"))
    ],
    targets: [
        .target(name: "PingOrchestrate", dependencies: [.product(name: "PingLogger", package: "PingLogger"), .product(name: "PingStorage", package: "PingStorage")], path: "Orchestrate", exclude: ["Orchestrate.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
