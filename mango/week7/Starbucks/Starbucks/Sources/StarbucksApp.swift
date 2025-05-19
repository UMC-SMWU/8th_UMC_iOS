import SwiftUI
import KakaoSDKCommon

@main
struct StarbucksApp: App {
    init() {
        // kakao sdk 초기화
        let kakaoAppKey = (Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] as? String) ?? ""
        KakaoSDK.initSDK(appKey: kakaoAppKey)
        
        print("✅ Kakao SDK Init 완료. Bundle ID: \(Bundle.main.bundleIdentifier ?? "없음")")

    }
    var body: some Scene {
        WindowGroup {
            AppRootView()
        }
    }
}
