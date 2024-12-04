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
        .package(name: "PingOidc", url: "https://github.com/spetrov/ping-oidc-spetrov", .upToNextMinor(from: "2.0.4")),
    ],
    targets: [
        .target(name: "PingDavinci", dependencies: [.product(name: "PingOidc", package: "PingOidc")], path: "Davinci", exclude: ["Davinci.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
