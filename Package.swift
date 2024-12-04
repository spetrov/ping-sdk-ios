// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Storage-iOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingStorage", targets: ["PingStorage"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "PingStorage", dependencies: [], path: "Storage", exclude: ["Storage.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
