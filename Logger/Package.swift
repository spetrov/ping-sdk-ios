// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Logger-spetrov",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingLoggerSpetrov", targets: ["PingLogger"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "PingLogger", dependencies: [], path: "Logger/Logger", exclude: ["Logger.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
