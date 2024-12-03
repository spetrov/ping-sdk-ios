// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Oidc-spetrov",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingOidcSpetrov", targets: ["PingOidc"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "PingOidcSpetrov", dependencies: [.target(name: "PingOrchestrateSpetrov")], path: "Oidc/Oidc", exclude: ["Oidc.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
