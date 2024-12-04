// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Oidc-spetrov",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingOidc", targets: ["PingOidc"])
    ],
    dependencies: [
        .package(name: "PingOrchestrate", url: "https://github.com/spetrov/ping-orchestrate-spetrov", .upToNextMinor(from: "2.0.2")),
    ],
    targets: [
        .target(name: "PingOidc", dependencies: [.product(name: "PingOrchestrate", package: "PingOrchestrate")], path: "Oidc/Oidc", exclude: ["Oidc.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
