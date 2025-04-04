//
//  BaseTabView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct BaseTabView: View {
    var body: some View {
        TabView {
            Tab("Home", image: "home") {
                HomeView()
            }
            Tab("Pay", image: "pay") {
                PayView()
            }
            Tab("Order", image: "order") {
                OrderView()
            }
            Tab("Shop", image: "shop") {
                ShopView()
            }
            Tab("Other", image: "other") {
                OtherView()
            }
        }
        .tint(.green01)
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
            
        }
    }
}

#Preview {
    BaseTabView()
}
