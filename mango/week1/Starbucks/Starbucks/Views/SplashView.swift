//
//  SplashView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct SplashView: View {
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 168, height: 168)
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color.green01)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToLogin = true
                }
            }
            // 자동 네비게이션 전환
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
        }
    }
}

#Preview {
    SplashView()
}
