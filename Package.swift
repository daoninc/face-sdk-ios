  
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
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceCapture.xcframework.zip",
            checksum: "4de38c82ab54b2e04a9e3f66d4c0873ed1c919b8ae1b55c625c78bd1db3fa5f3"
         ),
         .binaryTarget(
            name: "DaonFaceDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceDetector.xcframework.zip",
            checksum: "ba0e38c3a9e6e45834e3f1e2141aa51212b6561051e6bd47847d847f7dc47612"
         ),
         .binaryTarget(
            name: "DaonFaceLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceLiveness.xcframework.zip",
            checksum: "9529b2b658f9e1da2a7f26eaa30e64477412f7b704186ed722ba723cea028eb6"
         ),
         .binaryTarget(
            name: "DaonFaceLivenessBlink",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceLivenessBlink.xcframework.zip",
            checksum: "91ece2fa1734b53a2f0ef95bf0fd969bc7deddef2a15e5c0905cdd3b2d5f9ad9"
         ),
         .binaryTarget(
            name: "DaonFaceMaskDetector",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceMaskDetector.xcframework.zip",
            checksum: "c20ee9db6f2409a522a5051d7b03db2864f9e64aab22cf9a3659f83ac3196ddd"
         ),
         .binaryTarget(
            name: "DaonFaceMatcher",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceMatcher.xcframework.zip",
            checksum: "8b76e3c47cda430588e01a687d1745194d0706504895f2bc390ec18cd7ab416e"
         ),
         .binaryTarget(
            name: "DaonFacePassiveLiveness",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFacePassiveLiveness.xcframework.zip",
            checksum: "97d129cbaa5f3e9471004a31145123e95a6ba05f9a51d7592a57d71f73291a61"
         ),
         .binaryTarget(
            name: "DaonFaceQuality",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceQuality.xcframework.zip",
            checksum: "74e7c94cbf66097308469e338123a6509214c8d3dee99248be692e0a5b245e46"
         ),
         .binaryTarget(
            name: "DaonFaceSDK",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/DaonFaceSDK.xcframework.zip",
            checksum: "0fa0e3ef113ea53d9de3e685a73b66b9b7257d2ad6b263a2212bc2314214a102"
         ),
         .binaryTarget(
            name: "IDLiveFaceCamera",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/IDLiveFaceCamera.xcframework.zip",
            checksum: "de3df621118bfc51ffd4264336fc589ad3996d510dc6df21c21de9549e16580c"
         ),
         .binaryTarget(
            name: "IDLiveFaceIAD",
            url: "https://github.com/daoninc/face-sdk-ios/releases/download/5.3.163/IDLiveFaceIAD.xcframework.zip",
            checksum: "dd2b9eddcd951ef9d26fa0aafa78b06871df7f8ae3b3890c1e2c4bd64e14d197"
         ),
    ]
)
