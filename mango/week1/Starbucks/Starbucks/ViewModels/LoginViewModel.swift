//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var loginModel: LoginModel = .init(email: "mango", pwd: "mango")
}
