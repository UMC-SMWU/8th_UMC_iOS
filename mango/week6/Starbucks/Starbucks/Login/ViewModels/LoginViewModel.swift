//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false

    var router: NavigationRouter?

    func login(email: String, password: String) async {
        let loginData = LoginModel(email: email, password: password)
        guard let url = URL(string: "http://localhost:8080/login") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(loginData)

            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let decoded = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                        self.email = email
                        self.password = password
                        
                        let user = SignupModel(
                            nickname: decoded.nickname,
                            email: email,
                            password: password)
                        KeychainManager.saveSignupModel(user)
                    }
                }
            }
        } catch {
            print("로그인 에러: \(error)")
        }
    }

    func kakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 로그인
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print("카카오톡 로그인 실패:", error)
                } else if let oauthToken = oauthToken {
                    print("카카오톡 로그인 success")
                    self.saveKakaoInfo(oauthToken: oauthToken)
                }
            }
        } else {
            // 카카오계정 로그인
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    print("카카오계정 로그인 실패:", error)
                } else if let oauthToken = oauthToken {
                    print("카카오계정 로그인 success")
                    self.saveKakaoInfo(oauthToken: oauthToken)
                }
            }
        }
    }

    private func saveKakaoInfo(oauthToken: OAuthToken) {
        // 토큰 저장
        let token = TokenInfo(accessToken: oauthToken.accessToken, refreshToken: oauthToken.refreshToken)
        KeychainService.shared.saveToken(token)

        // 사용자 정보 저장 (닉네임 등)
        UserApi.shared.me { user, error in
            if let nickname = user?.kakaoAccount?.profile?.nickname {
                let kakaoUser = SignupModel(nickname: nickname, email: "mango@example.com", password: "mango123")
                KeychainManager.saveSignupModel(kakaoUser)
            }
        }
    }
}

struct LoginResponse: Decodable {
    let nickname: String
}
