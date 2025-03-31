//
//  LoginModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import Foundation

struct LoginModel {
    var email: String
    var pwd: String
    
    mutating func editEmail(email: String) {
        self.email = email
    }
    
    mutating func editPwd(pwd: String) {
        self.pwd = pwd
    }
}
