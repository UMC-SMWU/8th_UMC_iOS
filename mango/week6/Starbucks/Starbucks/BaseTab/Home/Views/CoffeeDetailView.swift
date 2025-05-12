//
//  CoffeeDetailView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    @Environment(NavigationRouter.self) private var router
    @Environment(HomeViewModel.self) var viewModel
    
    var body: some View {
        if let selectedCoffee = viewModel.selectedCoffeeModel {
            VStack(spacing: 0) {
                ZStack {
                    selectedCoffee.squareImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(edges: .top)
                        .offset(x: -35)

                    topNavigationBar
                }
                .frame(height: 355)
                
                contentView(coffee: selectedCoffee)
                    .padding(.top, 30)
                
                Spacer()
                
                orderButton
            }
        }
    }
    
    private var topNavigationBar: some View {
        VStack {
            HStack {
                Button(action : {
                    router.pop()
                }) {
                    Image("backbutton_white")
                        .background(
                            Circle()
                                .fill(Color.black.opacity(0.4))
                                .frame(width: 32, height: 32)
                        )
                }
                Spacer()
                Button(action : {
                }) {
                    Image("sharebutton")
                        .background(
                            Circle()
                                .fill(Color.black.opacity(0.4))
                                .frame(width: 32, height: 32)
                        )
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    private func contentView(coffee: CoffeeDetailModel) -> some View {
        VStack(alignment: .leading, spacing: 32) {
            titleGroup(coffee: coffee)
            
            contentGroup(coffee: coffee)
            
            if (coffee.bothTemps) {
                TempSelector(temp: coffee.temp)
            } else {
                TempTag(temp: coffee.temp)
            }
        }
        .padding(.horizontal, 10)
    }
    
    private func titleGroup(coffee: CoffeeDetailModel) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Text(coffee.name)
                    .foregroundStyle(Color.black03)
                    .font(.mainTextSemiBold24)
                
                Image("new")
            }
            Text(coffee.enName)
                .foregroundStyle(Color.gray01)
                .font(.mainTextSemiBold14)
        }
    }
    
    private func contentGroup(coffee: CoffeeDetailModel) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(coffee.content)
                .foregroundStyle(Color.gray06)
                .font(.mainTextSemiBold14)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true) // 수직 방향으로 늘어남 허용
            
            Text(coffee.price + "원")
                .foregroundStyle(Color.black03)
                .font(.mainTextBold24)
                
        }
    }
    
    private var orderButton: some View {
        ZStack {
            Rectangle()
                .fill(Color.white00)
                .ignoresSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: 73)
                .shadow(color: Color.black.opacity(0.04), radius: 5, x: 0, y: -3)
            
            Button(action: {
                print("주문하기")
            }, label: {
                Text("주문하기")
                    .foregroundStyle(.white)
                    .font(.mainTextMedium16)
                    .frame(maxWidth: 383, maxHeight: 43)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.green00)
                    )
            })
        }
        .padding(.bottom, 7)
    }
}
