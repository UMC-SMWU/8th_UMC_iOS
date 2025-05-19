//
//  TokenResponse.swift
//  7th_Practice
//
//  Created by 엄민서 on 5/19/25.
//

import Foundation

struct TokenResponse: Codable {
    var accessToken: String
    var refreshToken: String
}
