//
//  CircleImageCard.swift
//  UMC_Homework
//
//  Created by 김지우 on 4/7/25.
//

import SwiftUI

struct CircleImageCard: View {
    let menu: RecommendedMenu

    var body: some View {
        VStack(spacing: 8) {
            Image(menu.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .shadow(radius: 3)

            Text(menu.name)
            
                .font(.subheadline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .frame(width: 100) // 이름이 길 경우 대비
        }
    }
}
