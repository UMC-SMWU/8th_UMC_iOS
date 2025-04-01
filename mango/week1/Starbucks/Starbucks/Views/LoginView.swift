//
//  LoginView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            mainTopGroup
            Spacer().frame(height: 100)
            mainMiddleGroup
            Spacer().frame(height: 100)
            mainBottomGroup
        }
    }
    
    private var mainTopGroup: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(.logo)
                .resizable()
                .frame(width: 97, height: 95)
            Text("안녕하세요. \n스타벅스입니다.")
                .font(.mainTextExtraBold24)
            Text("회원 서비스 이용을 위해 로그인 해주세요.")
                .font(.mainTextMedium16)
                .foregroundColor(.gray01)
        }
        .padding(.leading, 19)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var mainMiddleGroup: some View {
        VStack(alignment: .leading, spacing: 19) {
            Text("아이디")
                .font(.mainTextRegular13)
                .foregroundColor(.black01)
            Divider()
            Text("비밀번호")
                .font(.mainTextRegular13)
                .foregroundColor(.black01)
            Divider()
            Button(action: {}) {
                Text("로그인하기")
                    .font(.mainTextMedium16)
                    .foregroundColor(.white00)
                    .frame(width: 402, height: 44)
                    .background(Color.green01)
                    .cornerRadius(20)
            }
        }
        .frame(width: 402, height: 108.5)
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
                .frame(width: 306, height: 45)
                .background(Color.yellow01)
                .cornerRadius(6)
            })
            
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
                .frame(width: 306, height: 45)
                .background(Color.black00)
                .cornerRadius(6)
            })
        }
    }
}

#Preview {
    LoginView()
}
