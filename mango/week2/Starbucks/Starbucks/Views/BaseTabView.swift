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
            Tab("Home", image: "Home") {
                HomeView()
            }
            Tab("Pay", image: "Pay") {
                PayView()
            }
            Tab("Order", image: "Order") {
                OrderView()
            }
            Tab("Shop", image: "Shop") {
                ShopView()
            }
            Tab("Other", image: "Other") {
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
