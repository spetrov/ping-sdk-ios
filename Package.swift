// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "Ping-Storage-spetrov",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PingStorageSpetrov", targets: ["PingStorage"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "PingStorage", dependencies: [], path: "Storage/Storage", exclude: ["Storage.h"], resources: [.copy("PrivacyInfo.xcprivacy")])
    ]
)
