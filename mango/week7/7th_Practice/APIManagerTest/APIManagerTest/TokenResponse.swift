//
//  TokenResponse.swift
//  APIManagerTest
//
//  Created by 엄민서 on 5/19/25.
//

import Foundation

struct TokenResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: UserInfo
}