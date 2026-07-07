// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Slideshow",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "Slideshow", targets: ["Slideshow"])
    ],
    targets: [
        .target(
            name: "Slideshow",
            path: "Sources",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        )
    ]
)
