import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var currentUserID: String = ""

    // Keychain 정보 활용하여 로그인 확인
    func login(id: String, pw: String) {
        if let savedID = KeychainHelper.shared.read(key: "userID"),
           let savedPW = KeychainHelper.shared.read(key: "password"),
           savedID == id, savedPW == pw {
            currentUserID = savedID
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }

    func logout() {
        isLoggedIn = false
        currentUserID = ""
    }

    // 회원가입 시 Keychain에 저장
    func register(id: String, pw: String, nickname: String) {
        KeychainHelper.shared.save(key: "nickname", value: nickname)
        KeychainHelper.shared.save(key: "userID", value: id)
        KeychainHelper.shared.save(key: "password", value: pw)
        login(id: id, pw: pw)
    }

    func getNickname() -> String {
        return KeychainHelper.shared.read(key: "nickname") ?? "Guest"
    }
}
