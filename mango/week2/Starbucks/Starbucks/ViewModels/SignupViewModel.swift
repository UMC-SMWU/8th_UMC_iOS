//
//  SignupViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @AppStorage("nickname") private var nickname: String = ""
    @AppStorage("email") private var email: String = ""
    @AppStorage("pwd") private var pwd: String = ""
    
    @Published var signupModel: SignupModel = .init(nickname: "mango", email: "mango@example.com", pwd: "mango")
    
    /// 현재 정보를 AppStorage에 저장
    public func saveAppStorage() {
        print("성공적으로 appStorage에 저장되었습니다!")
        self.nickname = signupModel.nickname
        self.email = signupModel.email
        self.pwd = signupModel.pwd
    }
}
