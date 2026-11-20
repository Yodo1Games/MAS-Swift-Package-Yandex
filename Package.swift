// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationYandex",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationYandex", targets: ["Yodo1MasMediationYandexTarget"]),
        .library(name: "Yodo1MasMediationYandex-AppLovinMediationYandexAdapter", targets: ["Yodo1MasMediationYandex-AppLovinMediationYandexAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/yandexmobile/yandex-ads-sdk-ios.git", exact: "8.3.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationYandex ====================
        .target(
            name: "Yodo1MasMediationYandexTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationYandex"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "YandexMobileAds", package: "yandex-ads-sdk-ios"),
            ],
            path: "Sources/Yodo1MasMediationYandexTarget",
            resources: [.copy("Yodo1MasYandex.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationYandex",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationYandex/Yodo1MasMediationYandex-5.0.0-beta.5.zip",
            checksum: "5c40cb6f4af7e1bfbc209ff5b04469d498de7164796295d81ae10fcb7ab7b1e2"
        ),
        // ==================== Yodo1MasMediationYandex-AppLovinMediationYandexAdapter ====================
        .target(
            name: "Yodo1MasMediationYandex-AppLovinMediationYandexAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationYandexTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationYandexAdapter"),
            ],
            path: "Sources/Yodo1MasMediationYandex-AppLovinMediationYandexAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationYandexAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationYandex/AppLovinMediationYandexAdapter-5.0.0-beta.5.zip",
            checksum: "ce64db9f9083ed263a0d9eea1a133baba5fa96bed3ffe99067c2ff7d53f31d61"
        ),
    ]
)
