//
//  TabView.swift
//  UMC_Homework
//
//  Created by 김지우 on 4/14/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, search, receipt, notifications, profile
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tabItem {
                    Image(selectedTab == .home ? "tab1" : "tab11")
                        .renderingMode(.template)
                    Text("Home")
                }
            
            // pay 로 수정하기
            HomeView()
                .tabItem {
                    Image(selectedTab == .search ? "tab2" : "tab22")
                        .renderingMode(.template)
                    Text("Pay")
                }
            
            //ReceiptView()
            HomeView()
                .tabItem {
                    Image(selectedTab == .receipt ? "tab3" : "tab33")
                        .renderingMode(.template)
                    Text("Order")
                }
            
            ShopView()
                .tabItem {
                    Image(selectedTab == .notifications ? "tab4" : "tab44")
                        .renderingMode(.template)
                    Text("Shop")
                }
            
            OtherView()
                .tabItem {
                    Image(selectedTab == .profile ? "tab5" : "tab55")
                        .renderingMode(.template)
                    Text("Other")
                }
        }
        .accentColor(.green02) // 선택될 때 초록색
    }
}

#Preview {
    MainTabView()
}
