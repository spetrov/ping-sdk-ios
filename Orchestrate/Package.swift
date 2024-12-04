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
        .package(name: "PingLogger", url: "git@github.com:spetrov/ping-logger-spetrov.git", .upToNextMinor(from: "1.0.0")),
        .package(name: "PingStorage", url: "git@github.com:spetrov/ping-storage-spetrov.git", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "PingOrchestrate", dependencies: [.product(name: "PingLogger", package: "PingLogger"), .product(name: "PingStorage", package: "PingStorage")], path: "Orchestrate", exclude: ["Orchestrate.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
