//
//  SplashView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct SplashView: View {
    @Environment(NavigationRouter.self) var router

    var body: some View {
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                router.push(.login)
            }
        }
    }
}

#Preview {
    SplashView()
}
