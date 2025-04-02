//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI
import Foundation

class LoginViewModel: ObservableObject {
    @Published var loginModel: LoginModel = .init(id: "mango", pwd: "mango")
}
