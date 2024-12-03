// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Davinci-spetrov",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingDavinciSpetrov", targets: ["PingDavinci"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "PingDavinci", dependencies: [.target(name: "PingOidcSpetrov"),], path: "Davinci/Davinci", exclude: ["Davinci.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
