// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Oidc-iOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingOidc", targets: ["PingOidc"])
    ],
    dependencies: [
        .package(name: "PingOrchestrate", url: "git@github.com:spetrov/ping-orchestrate-spetrov.git", .upToNextMinor(from: "1.0.0")),
    ],
    targets: [
        .target(name: "PingOidc", dependencies: [.product(name: "PingOrchestrate", package: "PingOrchestrate")], path: "Oidc", exclude: ["Oidc.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
