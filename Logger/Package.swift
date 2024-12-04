// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Logger-iOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingLogger", targets: ["PingLogger"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "PingLogger", dependencies: [], path: "Logger", exclude: ["Logger.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
