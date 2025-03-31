//
//  SplashView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image(.starbucks)
                .resizable()
                .frame(width: 168, height: 168)
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(.green01)
    }
}

#Preview {
    SplashView()
}
