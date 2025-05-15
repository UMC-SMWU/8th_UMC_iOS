//
//  UMC_HomeworkApp.swift
//  UMC_Homework
//
//  Created by 김지우 on 4/2/25.
//

import SwiftUI

@main
struct UMC_HomeworkApp: App {
    @StateObject var userManager = UserManager() // 로그인 상태 관리 객체

    var body: some Scene {
        WindowGroup {
            if userManager.isLoggedIn {
                MainTabView() // 로그인된 상태일 경우
            } else {
                LoginView()
                    .onAppear {
                        if let id = KeychainHelper.shared.read(key: "userID"),
                           let pw = KeychainHelper.shared.read(key: "password") {
                            userManager.login(id: id, pw: pw) // 자동 로그인 시도
                        }
                    }
            }
        }
    }
}
