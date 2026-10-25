// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VoicevoxCore",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "VoicevoxCore",
            targets: ["VoicevoxCoreBinary"])
    ],
    targets: [
        .binaryTarget(
            name: "VoicevoxCoreBinary",
            url: "https://github.com/VOICEVOX/voicevox_core/releases/download/0.17.1/voicevox_core-xcframework-0.17.1.zip",
            checksum: "d01e1d511895944a86857d736bc0e0a1a079a4ed68f985477f4f327bdb22ec61"
        ),
        // NOTE: voicevox_core は、link と load の 2パターンが存在する
        // そのため、ONNX Runtime を xcframework で提供すると、load の場合に特別な対応が必要となり体験を損ねるため、voicevox_core のみを提供する
    ]
)
