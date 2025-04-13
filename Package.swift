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
            url: "https://github.com/VOICEVOX/voicevox_core/releases/download/0.16.0/voicevox_core-ios-xcframework-cpu-0.16.0.zip",
            checksum: "2cc4d209d594f7815b87348c2157635fa9288d2e2cd8c342887ee68442ba2ee1"
        ),
        // NOTE: voicevox_core は、link と load の 2パターンが存在する
        // そのため、ONNX Runtime を xcframework で提供すると、load の場合に特別な対応が必要となり体験を損ねるため、voicevox_core のみを提供する
    ]
)
