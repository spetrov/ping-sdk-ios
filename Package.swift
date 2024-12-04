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
        .package(name: "PingLoggerSpetrov", url: "git@github.com:spetrov/ping-logger-spetrov.git", .upToNextMinor(from: "1.0.0")),
    ],
    targets: [
        .target(name: "PingOidc", dependencies: [.product(name: "PingLoggerSpetrov", package: "PingLoggerSpetrov")], path: "Oidc/Oidc", exclude: ["Oidc.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
