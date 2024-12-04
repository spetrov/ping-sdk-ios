// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Davinci-iOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingDavinci", targets: ["PingDavinci"])
    ],
    dependencies: [
        .package(name: "PingLogger", url: "git@github.com:spetrov/ping-oidc-spetrov.git", .upToNextMinor(from: "1.0.0")),
    ],
    targets: [
        .target(name: "PingDavinci", dependencies: [.target(name: "PingOidc", package: "PingOidc")], path: "Davinci", exclude: ["Davinci.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
