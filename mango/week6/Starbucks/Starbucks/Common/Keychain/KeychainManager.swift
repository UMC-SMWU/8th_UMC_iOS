//
//  KeychainManager.swift
//  Starbucks
//
//  Created by 엄민서 on 5/12/25.
//

import Foundation
import Security

enum KeychainManager {
    static func save(_ key: String, value: String) {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]
            SecItemDelete(query as CFDictionary)
            SecItemAdd(query as CFDictionary, nil)
        }
    }

    static func load(_ key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var result: AnyObject?
        if SecItemCopyMatching(query as CFDictionary, &result) == noErr,
           let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    static func delete(_ key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }

    static private let userCredentialKey = "userCredential"

    static func saveSignupModel(_ model: SignupModel) {
        do {
            let data = try JSONEncoder().encode(model)
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: userCredentialKey,
                kSecValueData as String: data
            ]
            SecItemDelete(query as CFDictionary)
            let status = SecItemAdd(query as CFDictionary, nil)
            print(status == errSecSuccess ? "사용자 저장 성공" : "사용자 저장 실패")
        } catch {
            print("인코딩 실패: \(error)")
        }
    }

    static func loadSignupModel() -> SignupModel? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: userCredentialKey,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var result: AnyObject?
        if SecItemCopyMatching(query as CFDictionary, &result) == noErr,
           let data = result as? Data {
            return try? JSONDecoder().decode(SignupModel.self, from: data)
        }
        return nil
    }

    static func deleteSignupModel() {
        delete(userCredentialKey)
    }
}
