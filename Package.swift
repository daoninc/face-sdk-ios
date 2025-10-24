  
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
                "DaonFaceQuality"
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
                "DaonFaceLiveness"
            ]
        ),
        .library(
            name: "DaonFaceLivenessBlink",
            targets: [
                "DaonFaceLivenessBlink"
            ]
        ),        
        .library(
            name: "DaonFacePassiveLiveness",
            targets: [
                "DaonFacePassiveLiveness",
                "DaonFaceMatcher",
                "DaonFaceDetector",
                "DaonFaceQuality"
            ]
        ),
        .library(
            name: "DaonFaceMaskDetector",
            targets: [
                "DaonFaceMaskDetector"
            ]
        ),
        .library(
            name: "DaonFaceMatcher",
            targets: [
                "DaonFaceMatcher",
                "DaonFaceDetector"
            ]
        ),                   
    ],
    targets: [
         .binaryTarget(
            name: "DaonFaceCapture",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceCapture.xcframework.zip",
            checksum: "4bcfcceed19ffcf250e54a8f7b7e6a3fa478c42a1b75bb95cbfaca2e6923bc3b"
         ),
         .binaryTarget(
            name: "DaonFaceDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceDetector.xcframework.zip",
            checksum: "edf73102ef445816418dc742a203608b1c82694c773623c65793d054165e23b0"
         ),
         .binaryTarget(
            name: "DaonFaceLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceLiveness.xcframework.zip",
            checksum: "93c2fc5002fdf663b6a7a5fb3afb93b5b3883910216da06765a2b89877833dbe"
         ),
         .binaryTarget(
            name: "DaonFaceLivenessBlink",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceLivenessBlink.xcframework.zip",
            checksum: "a4bc08837444b8e9951b645a98e16819a08767ad879e7dbdf758e9a2c30985b7"
         ),
         .binaryTarget(
            name: "DaonFaceMaskDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceMaskDetector.xcframework.zip",
            checksum: "fb881fed6d7424fad8122548d9ef085889284cab9f0cbdc28534a3b8e6e00a0f"
         ),
         .binaryTarget(
            name: "DaonFaceMatcher",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceMatcher.xcframework.zip",
            checksum: "3822f353b89b518e68178810614b7e94affa1aa5c4276448bb96b5d7e42415cb"
         ),
         .binaryTarget(
            name: "DaonFacePassiveLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFacePassiveLiveness.xcframework.zip",
            checksum: "01c5302de007c07cb67a50784569cce7a7e073ef14e948457f3c2bc8233b595f"
         ),
         .binaryTarget(
            name: "DaonFaceQuality",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceQuality.xcframework.zip",
            checksum: "6143c85df062ac2dd27eeba157ab05366c7d36b963d4297877b9bcbccb657334"
         ),
         .binaryTarget(
            name: "DaonFaceSDK",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/DaonFaceSDK.xcframework.zip",
            checksum: "8ea09265f70df8c7807a71634109252baa3c96b86fd67e5d3a835b99156d12f7"
         ),
         .binaryTarget(
            name: "IDLiveFaceCamera",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/IDLiveFaceCamera.xcframework.zip",
            checksum: "7e694cece97f678ffdd18a1e0ed16b2d2ecae851567f47c64079f6162ecbf702"
         ),
         .binaryTarget(
            name: "IDLiveFaceIAD",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.175/IDLiveFaceIAD.xcframework.zip",
            checksum: "6a0142cea702f608301f5ac941a1c8a003f96b84adf0816d49a92a92113a4a73"
         ),
    ]
)
