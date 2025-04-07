//
//  HomeView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("nickname") private var nickname: String = "(설정 닉네임)"
    @Environment(HomeViewModel.self) var viewModel
    @Environment(NavigationRouter.self) private var router
    @State private var showPopup = true
    
    var body: some View {
        ScrollView {
            topBannerView
            
            contentView
        }
        .ignoresSafeArea(edges: .top)
    }
    
    private var topBannerView: some View {
        ZStack(alignment: .topLeading) {
            Image("topBanner")
            VStack(alignment: .leading) {
                RewardSection(currentStars: 1, goalStars: 12)
            }
            .padding(.horizontal, 28)
        }
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 20) {
            bannersView1
                .padding(.horizontal, 10)

            recommendView
                .padding(.leading, 10)
            
            bannersView2
                .padding(.horizontal, 10)

            whatsNewView
                .padding(.leading, 10)

            bannersView3
                .padding(.horizontal, 10)
            
            dessertView
                .padding(.leading, 10)
            
            bannersView4
                .padding(.horizontal, 10)
        }
    }
    
    private var bannersView1: some View {
        ZStack(alignment: .leading) {
            Image("adBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, minHeight: 183)
            
            VStack(alignment: .leading) {
                Text("아이스 챌린지 카페 아메리카노")
                    .foregroundStyle(Color.brown01)
                    .font(.mainTextBold22)
                    .kerning(-0.5)
                Text("주문하고,")
                    .foregroundStyle(Color.white00)
                    .font(.mainTextBold22)
                    .kerning(-0.5)
                HStack(spacing: 0) {
                    Text("사이즈 업")
                        .foregroundStyle(Color.brown01)
                        .font(.mainTextBold22)
                        .kerning(-0.5)
                    Text("받으세요!")
                        .foregroundStyle(Color.white00)
                        .font(.mainTextBold22)
                        .kerning(-0.5)
                }
                Text("2023. 1. 26 ~ 1. 30")
                    .foregroundStyle(Color.white00)
                    .font(.mainTextBold16)
                    .padding(.top, 16)
            }
            .padding(.leading, 24)
        }
    }
    private var recommendView: some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack(spacing: 0) {
                Text(nickname)
                    .foregroundStyle(Color.brown01)
                    .font(.mainTextBold24)
                Text("님을 위한 추천 메뉴")
                    .foregroundStyle(.black)
                    .font(.mainTextBold24)
            }
            .padding(.horizontal, 10)
            
            ScrollView(.horizontal, content: {
                
                LazyHStack(spacing: 16, content: {
                    ForEach(viewModel.dummyCoffees, id: \.id) { coffee in
                        CircleImageCard(model: coffee)
                            .onTapGesture {
                                viewModel.selectedCoffeeModel = coffee
                                router.push(.coffeedetail)
                            }
                    }
                })
            })
            .scrollIndicators(.hidden)
            .padding(.leading, 10)
        }
    }
    
    private var bannersView2: some View {
        VStack(spacing: 20) {
            Image("bloomingBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image("serviceSuscribe")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    private var whatsNewView: some View {
        VStack(alignment: .leading) {
            Text("What’s New")
                .foregroundStyle(Color.black03)
                .font(.mainTextBold24)
            
            ScrollView(.horizontal, content: {

                LazyHStack(spacing: 16, content: {
                    ForEach(viewModel.dummyNews, id: \.id) { new in
                        NewsCard(news: new)
                    }
                })
            })
            .scrollIndicators(.hidden)
        }
    }
    
    private var bannersView3: some View {
        VStack(spacing: 14) {
            Image("mugcupBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, minHeight: 218)
            
            ZStack(alignment: .leading) {
                Image("onlinestoreBanner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, minHeight: 273)
                
                VStack(alignment: .leading) {
                    Text("TIP")
                        .foregroundStyle(Color.gray09)
                        .font(.mainTextSemiBold12)
                    Text("온라인 스토어\n별★ 적립 혜택")
                        .foregroundStyle(Color.black03)
                        .font(.mainTextBold24)
                        .padding(.top, 4)
                    Text("온라인 스토어 구매 시\n별★을 적립해 드립니다.")
                        .foregroundStyle(Color.gray09)
                        .font(.mainTextBold16)
                        .padding(.top, 16)
                }
                .padding(.leading, 20)
            }
            
            ZStack(alignment: .leading) {
                Image("deliveryserviceBanner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, minHeight: 218)
                
                VStack(alignment: .leading) {
                    Text("딜리버스\n예약 배달 서비스")
                        .foregroundStyle(Color.green04)
                        .font(.mainTextBold22)
                        .kerning(-0.5)
                    Text("특별한 순간을 위해\n미리 예약해 보세요.")
                        .foregroundStyle(Color.black02)
                        .font(.mainTextBold16)
                        .padding(.top, 16)
                }
                .padding(.leading, 24)
            }
        }
    }
    
    private var dessertView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("하루가 달콤해지는 디저트")
                .foregroundStyle(Color.black03)
                .font(.mainTextBold24)
                .padding(.horizontal, 10)
            
            ScrollView(.horizontal, content: {
                LazyHStack(spacing: 16, content: {
                    ForEach(viewModel.dummyBreads, id: \.id) { dessert in
                        CircleImageCard(model: dessert)
                    }
                })
            })
            .scrollIndicators(.hidden)
            .padding(.leading, 10)
        }
    }
    
    private var bannersView4: some View {
        VStack(spacing: 20) {
            Image("coldbrewBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, minHeight: 182)
            
            Image("representativeBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, minHeight: 360)
            
            Image("manufacturingBanner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, minHeight: 182)
        }
        // Home화면 방문할 때마다 팝업 뜨도록 설정
//        .onAppear {
//            showPopup = true
//        }
        .sheet(isPresented: $showPopup) {
            PopupView()
        }
    }
}
