// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Orchestrate-spetrov",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingOrchestrateSpetrov", targets: ["PingOrchestrate"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "PingOrchestrateSpetrov", dependencies: [.target(name: "PingLoggerSpetrov"), .target(name: "PingStorageSpetrov")], path: "Orchestrate/Orchestrate", exclude: ["Orchestrate.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
