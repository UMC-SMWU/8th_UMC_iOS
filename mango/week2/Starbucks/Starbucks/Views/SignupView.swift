//
//  SignupView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel: SignupViewModel = .init()
    
    var body: some View {
        VStack {
            mainMiddleGroup
            Spacer()
            createButton
        }
        .padding(.top, 210)
        .padding(.bottom, 72)
        .padding(.horizontal, 19)
    }
    
    private var mainMiddleGroup: some View {
        VStack(alignment: .leading, spacing: 49) {
            TextField("닉네임", text: $viewModel.signupModel.nickname)
                .font(.mainTextRegular18)
                .foregroundStyle(Color.black01)
                .autocapitalization(.none)
                .overlay(alignment: .bottom, content: {
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray00)
                        .offset(x: 0, y: 9)
                })
            
            TextField("이메일", text: $viewModel.signupModel.email)
                .font(.mainTextRegular18)
                .foregroundStyle(Color.black01)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .overlay(alignment: .bottom) {
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray00)
                        .offset(x: 0, y: 9)
                }
            
            SecureField("비밀번호", text: $viewModel.signupModel.pwd)
                .font(.mainTextRegular18)
                .foregroundStyle(Color.black01)
                .autocapitalization(.none)
                .overlay(alignment: .bottom) {
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray00)
                        .offset(x: 0, y: 9)
                }
        }
    }
    private var createButton: some View {
        Button(action: {
            viewModel.saveAppStorage()
        }, label: {
            Text("생성하기")
                .font(.mainTextMedium18)
                .foregroundStyle(.white)
                .frame(maxWidth: 402, maxHeight: 58)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green01)
                )
        })
    }
}

#Preview {
    SignupView()
}
