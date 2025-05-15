import Foundation
import Alamofire

class KakaoAuthService {
    static let shared = KakaoAuthService()

    func requestToken(with code: String) {
        let url = "https://kauth.kakao.com/oauth/token"

        let parameters: Parameters = [
            "grant_type": "authorization_code",
            "client_id": "YOUR_KAKAO_REST_API_KEY",
            "redirect_uri": "yourapp://oauth",
            "code": code
        ]

        AF.request(url, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: TokenResponse.self) { response in
                switch response.result {
                case .success(let token):
                    print("Access Token: \(token.access_token)")
                    KeychainHelper.shared.save(key: "kakaoAccessToken", value: token.access_token)
                case .failure(let error):
                    print("토큰 요청 실패: \(error)")
                }
            }
    }
}
