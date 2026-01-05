// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VoicevoxCore",
    platforms: [
        .iOS(.v16),
        // .macOS(.v13), // NOTE: https://github.com/VOICEVOX/voicevox_core/pull/1056 がリリースされたら外す
    ],
    products: [
        .library(
            name: "VoicevoxCore",
            targets: ["VoicevoxCoreBinary"])
    ],
    targets: [
        .binaryTarget(
            name: "VoicevoxCoreBinary",
            url: "https://github.com/VOICEVOX/voicevox_core/releases/download/0.16.3/voicevox_core-ios-xcframework-cpu-0.16.3.zip",
            checksum: "e8439a94cc2cb76657d63b3ff0b7d8a2a445358b57cb04ae92580a416397df39"
        ),
        // NOTE: voicevox_core は、link と load の 2パターンが存在する
        // そのため、ONNX Runtime を xcframework で提供すると、load の場合に特別な対応が必要となり体験を損ねるため、voicevox_core のみを提供する
    ]
)
