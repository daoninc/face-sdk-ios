  
// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "DaonFACE",
    products: [
        .library(
            name: "DaonFaceSDK",
            targets: [
                "DaonFaceSDK"
            ]
        ),
        .library(
            name: "DaonFaceQuality",
            targets: [
                "DaonFaceQuality",
                "DaonFaceSDK"
            ]
        ),
        .library(
            name: "DaonFaceCapture",
            targets: [
                "DaonFaceCapture", 
                "DaonFaceSDK",
                "DaonFaceQuality",
                "IDLiveFaceCamera",
                "IDLiveFaceIAD"
            ]
        ),
        .library(
            name: "DaonFaceLiveness",
            targets: [
                "DaonFaceLiveness",
                "DaonFaceSDK"
            ]
        ),
        .library(
            name: "DaonFaceLivenessBlink",
            targets: [
                "DaonFaceLivenessBlink",
                "DaonFaceSDK"
            ]
        ),        
        .library(
            name: "DaonFacePassiveLiveness",
            targets: [
                "DaonFacePassiveLiveness",
                "DaonFaceMatcher",
                "DaonFaceDetector",
                "DaonFaceQuality",
                "DaonFaceSDK"
            ]
        ),
        .library(
            name: "DaonFaceLivenessHMD",
            targets: [
                "DaonFaceLivenessHMD",
                "DaonFaceSDK"
            ]
        ),                    
        .library(
            name: "DaonFaceLivenessCLR",
            targets: [
                "DaonFaceLivenessCLR",
                "DaonFaceSDK"
            ]
        ), 
        .library(
            name: "DaonFaceMaskDetector",
            targets: [
                "DaonFaceMaskDetector",
                "DaonFaceSDK"
            ]
        ),
        .library(
            name: "DaonFaceMatcher",
            targets: [
                "DaonFaceMatcher",
                "DaonFaceDetector",
                "DaonFaceSDK"
            ]
        ),                   
    ],
    targets: [
         .binaryTarget(
            name: "DaonFaceCapture",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceCapture.xcframework.zip",
            checksum: "b085fcfd93497b46216754ff975f46f2e19831b28014d94feaf564023a1d62e9"
         ),
         .binaryTarget(
            name: "DaonFaceDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceDetector.xcframework.zip",
            checksum: "3d2711c963b89161ed49667e04591e6a6a0f11eb5e1f89afe6eeb8895ea24e05"
         ),
         .binaryTarget(
            name: "DaonFaceLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceLiveness.xcframework.zip",
            checksum: "5c29d0feffa657c8b5e8bae7080ffa12a27bcc984b8cbdf734e8c426a2d41335"
         ),
         .binaryTarget(
            name: "DaonFaceLivenessBlink",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceLivenessBlink.xcframework.zip",
            checksum: "d4bc208b0dafa4fff2f38b61ce3f4e45728c4516f08eeb540778457da2ae63b6"
         ),
         .binaryTarget(
            name: "DaonFaceMaskDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceMaskDetector.xcframework.zip",
            checksum: "63b4f2f86a40768637fc1e78b112c9c5d4ac05fa5614a843b3268863516a8482"
         ),
         .binaryTarget(
            name: "DaonFaceMatcher",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceMatcher.xcframework.zip",
            checksum: "2d9543f1b102be1f6db2bbb98b4b75be0cc1b7dac9631025ec5557fb01ba054e"
         ),
         .binaryTarget(
            name: "DaonFacePassiveLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFacePassiveLiveness.xcframework.zip",
            checksum: "b14245d2e1e3bc37be28dce54bead78e7029ddaf073fe94763e6e8eca315837e"
         ),
         .binaryTarget(
            name: "DaonFaceQuality",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceQuality.xcframework.zip",
            checksum: "20da3f94d14e410d1fb80e93102fdf280dcb7c1d04a7633b4f9aaf0031e539d8"
         ),
         .binaryTarget(
            name: "DaonFaceSDK",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/DaonFaceSDK.xcframework.zip",
            checksum: "4e87ab3d34263cadfeddd53a11e5fd48c403aecb1fe403a2b1a5ec1e60172773"
         ),
         .binaryTarget(
            name: "IDLiveFaceCamera",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/IDLiveFaceCamera.xcframework.zip",
            checksum: "519742572ba283d6dbf578230bbb039767ae501981f0a52547cda269aa3e3252"
         ),
         .binaryTarget(
            name: "IDLiveFaceIAD",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.134/IDLiveFaceIAD.xcframework.zip",
            checksum: "0e57039353a5d1591e4878ac794fe12e8fe8932f6e5fb650ddad2cebf856755f"
         ),
    ]
)
