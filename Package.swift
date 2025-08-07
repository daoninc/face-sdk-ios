  
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
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceCapture.xcframework.zip",
            checksum: "b5082673d84c8c869e478ed70646e2557f9cafc0676b93f90129fecf5102204b"
         ),
         .binaryTarget(
            name: "DaonFaceDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceDetector.xcframework.zip",
            checksum: "11919e97bde5e69c64ff8b7d8679c52ffe4c90b5ed244b59cc580378bdf62db8"
         ),
         .binaryTarget(
            name: "DaonFaceLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceLiveness.xcframework.zip",
            checksum: "5dd147d223fb25d3f6b09f08f2f3c19b64a49168b5243c6ac50dd52ee94d1718"
         ),
         .binaryTarget(
            name: "DaonFaceLivenessBlink",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceLivenessBlink.xcframework.zip",
            checksum: "7bd1a919f1d6b0e635bba3245863291d5daa279f52d2976d6f4fd3fa899c51ee"
         ),
         .binaryTarget(
            name: "DaonFaceMaskDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceMaskDetector.xcframework.zip",
            checksum: "91d3097e3c5b9a16ecaebab3f7e1d082c9fade2b88c1ac8e685fe91e3bc9c887"
         ),
         .binaryTarget(
            name: "DaonFaceMatcher",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceMatcher.xcframework.zip",
            checksum: "17ed2adae320e65594a86b06bee9ffa461fbab934e6aa15d6193c0999ab6ef2b"
         ),
         .binaryTarget(
            name: "DaonFacePassiveLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFacePassiveLiveness.xcframework.zip",
            checksum: "08bdde4f45b0f2b7220b0122a81ff880bfaca89333fea546ed2d6fab697b4d61"
         ),
         .binaryTarget(
            name: "DaonFaceQuality",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceQuality.xcframework.zip",
            checksum: "a476d2157494136694397fa2a1a6885c0afab6d410a6cec06f1ba47e8ebd3057"
         ),
         .binaryTarget(
            name: "DaonFaceSDK",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/DaonFaceSDK.xcframework.zip",
            checksum: "cbaf73b245f42c267dcb9a4d16fd8c3e35ca077a4bcfe1a0c14092a0a7ce0f0e"
         ),
         .binaryTarget(
            name: "IDLiveFaceCamera",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/IDLiveFaceCamera.xcframework.zip",
            checksum: "5727424d4391a5b3a3ea0c8aba5c1f5842b3c3d448a5401efe6ab758c1012300"
         ),
         .binaryTarget(
            name: "IDLiveFaceIAD",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.164/IDLiveFaceIAD.xcframework.zip",
            checksum: "819b2cedec2fb2c2027da23ca72a23dc5a4528ff0dee563f7f1109e3c2f4e261"
         ),
    ]
)
