//
//  UserDTO.swift
//  TestAlamofire
//
//  Created by 엄민서 on 5/12/25.
//


import Foundation

struct UserDTO: Codable {
    let name: String
    let age: Int
    let address: String
    let height: Double
}