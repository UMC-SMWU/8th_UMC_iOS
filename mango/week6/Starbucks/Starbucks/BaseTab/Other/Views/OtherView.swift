//
//  OtherView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import Foundation
import SwiftUI

struct OtherView: View {
//    @AppStorage("nickname") private var nickname: String = "(작성한 닉네임)"
    @Environment(NavigationRouter.self) private var router
    
    var nickname: String {
        KeychainManager.loadSignupModel()?.nickname ?? "닉네임 없음"
    }
    
    var body: some View {
        VStack {
            topView
            contentView
        }
    }
    
    private var topView: some View {
        HStack {
            Text("Other")
                .font(.mainTextBold24)
                .foregroundStyle(Color.black00)
            
            Spacer()
                .frame(width: 295)
            
            Button(action: {
                print("로그아웃")
                router.push(.login)
            }, label: {
                Image("logout")
                    .resizable()
                    .frame(width: 35, height: 35)
            })
        }
        .background(Color.white00)
    }
    
    private var contentView: some View {
        VStack {
            infoView
            
            Spacer()
            
            payView
            
            Spacer()
            
            supportView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 41)
        .background(Color.white01)
    }
    
    private var infoView: some View {
        VStack {
            VStack(spacing: 5) {
                HStack {
                    Text(nickname)
                        .foregroundStyle(Color.green01)
                        .font(.mainTextSemiBold24)
                    Text("님")
                        .foregroundStyle(Color.black02)
                        .font(.mainTextSemiBold24)
                }
                Text("환영합니다! 🙌🏻")
                    .foregroundStyle(Color.black02)
                    .font(.mainTextSemiBold24)
            }
            
            HStack(spacing: 10.5) {
                OtherTabButton(icon: Image("star"), title: "별 히스토리")
                OtherTabButton(icon: Image("receipt"), title: "전자영수증") {
                    router.push(.receipt)
                }
                OtherTabButton(icon: Image("mycup"), title: "나만의 메뉴")
            }
            .padding(.top, 24)
        }
    }
    
    private var payView: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.mainTextSemiBold18)
                .padding(.bottom, 8)
            
            HStack {
                OtherTabList(icon: Image("icon1"), title: "스타벅스 카드 등록")
                
                Spacer()
                
                OtherTabList(icon: Image("icon2"), title: "카드 교환권 등록")
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherTabList(icon: Image("icon3"), title: "쿠폰 등록")
                
                Spacer()
                
                OtherTabList(icon: Image("icon4"), title: "쿠폰 히스토리")
            }
            .padding(.vertical, 16)
        }
        .overlay(alignment: .bottom) {
            Divider()
                .background(Color.black00.opacity(0.12))
        }
        .padding(.horizontal, 10)
    }
    
    private var supportView: some View {
        VStack(alignment: .leading) {
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .padding(.bottom, 8)

            HStack {
                OtherTabList(icon: Image("icon5"), title: "스토어 케어")
                
                Spacer()
                
                OtherTabList(icon:Image("icon6"), title: "고객의 소리")
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherTabList(icon: Image("icon7"), title: "매장 정보") {
                    router.push(.othermap)
                }

                Spacer()
                
                OtherTabList(icon: Image("icon8"), title: "반납기 정보")
            }
            .padding(.vertical, 16)
            
            HStack {
                OtherTabList(icon: Image("icon9"), title: "마이 스타벅스 리뷰")
                
                Spacer()
            }
            .padding(.vertical, 16)
        }
        .padding(.bottom, 41)
        .padding(.horizontal, 10)
    }
}

#Preview {
    OtherView()
}
