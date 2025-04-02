//
//  LoginView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct LoginView: View {
    enum LoginField {
        case id
        case pwd
    }
    @StateObject var viewModel: LoginViewModel = .init()
    @FocusState private var focusedField: LoginField?
    
    var body: some View {
        VStack {
            mainTopGroup
            Spacer()
            mainMiddleGroup
            Spacer()
            mainBottomGroup
        }
        .padding(.horizontal, 19)
    }
    
    private var mainTopGroup: some View {
        VStack(alignment: .leading) {
            Image(.logo)
                .resizable()
                .frame(width: 97, height: 95)
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Text("안녕하세요.\n스타벅스입니다.")
                    .font(.mainTextExtraBold24)
                Spacer()
            }
            .frame(height: 58)
            .padding(.top, 28)
            
            HStack {
                Text("회원 서비스 이용을 위해 로그인 해주세요")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color.gray01)
                Spacer()
            }
            .padding(.top, 16)
        }
        .padding(.top, 106)
    }
    
    private var mainMiddleGroup: some View {
        VStack(alignment: .leading, spacing: 45) {
            TextField("아이디", text: $viewModel.loginModel.id)
                .font(.mainTextRegular13)
                .foregroundStyle(Color.black01)
                .autocapitalization(.none)
                .focused($focusedField, equals: .id)
                .overlay(alignment: .bottom) {
                    Divider()
                        .frame(height: 1)
                        .background(focusedField == .id ? Color.green01 : Color.gray00)
                        .offset(x: 0, y: 5)
                }
            
            SecureField("비밀번호", text: $viewModel.loginModel.pwd)
                .font(.mainTextRegular13)
                .foregroundStyle(Color.black01)
                .autocapitalization(.none)
                .focused($focusedField, equals: .pwd)
                .overlay(alignment: .bottom) {
                    Divider()
                        .frame(height: 1)
                        .background(focusedField == .pwd ? Color.green01 : Color.gray00)
                        .offset(x: 0, y: 5)
                }
            
            Button(action: {
                print("로컬 로그인 버튼")
            }, label: {
                Text("로그인하기")
                    .font(.mainTextMedium16)
                    .foregroundStyle(.white)
            })
            .frame(maxWidth: 402, maxHeight: 46)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green01)
            )
        }
    }
    
    private var mainBottomGroup: some View {
        VStack(spacing: 19) {
            Text("이메일로 회원가입하기")
                .font(.mainTextRegular12)
                .foregroundColor(.gray04)
                .underline()
            Button(action: {
                print("카카오 로그인 버튼 클릭")
            }, label: {
                HStack {
                    Image(.kakaologo)
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("카카오 로그인")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.black00)
                }
            })
            .frame(width: 306, height: 45)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.yellow01)
            )
            
            Button(action: {
                print("애플 로그인 버튼 클릭")
            }, label: {
                HStack {
                    Image(.applelogo)
                        .resizable()
                        .frame(width: 15, height: 18)
                    Text("Apple로 로그인")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color.white00)
                }
            })
            .frame(width: 306, height: 45)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.black00)
            )
        }
    }
}
