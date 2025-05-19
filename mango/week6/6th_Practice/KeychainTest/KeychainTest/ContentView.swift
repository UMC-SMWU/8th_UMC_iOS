//
//  ContentView.swift
//  KeychainTest
//
//  Created by 엄민서 on 5/12/25.
//

import SwiftUI

struct ContentView: View {
    
    let keychain = KeychainService.shared
    
    let tokenInfo = TokenInfo(accessToken: "abc123", refreshToken: "xyz456")
    
    enum ButtonType: String, CaseIterable {
        case save = "저장하기"
        case load = "불러오기"
        case delete = "삭제하기"
    }
    
    var body: some View {
        VStack(spacing: 10, content: {
            ForEach(ButtonType.allCases, id: \.rawValue, content: { button in
                Button(action: {
                    handleAction(button)
                }, label: {
                    Text(button.rawValue)
                        .font(.title)
                })
            })
        })
    }
    
    func handleAction(_ type: ButtonType) {
        switch type {
        case .save:
            keychain.saveToken(tokenInfo)
        case .load:
            keychain.loadToken()
        case .delete:
            keychain.deleteToken()
        }
    }
}

#Preview {
    ContentView()
}
