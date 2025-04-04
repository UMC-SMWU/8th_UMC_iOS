//
//  TempSelector.swift
//  Starbucks
//
//  Created by 엄민서 on 4/5/25.
//

import SwiftUI

struct TempSelector: View {
    let temp: CoffeeTemp

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.gray07)
                .frame(height: 36)
            
            HStack(spacing: 0) {
                tempLabel("HOT", isSelected: temp == .hot, color: .red01)
                tempLabel("ICED", isSelected: temp == .iced, color: .blue01)
            }
        }
    }

    @ViewBuilder
    private func tempLabel(_ text: String, isSelected: Bool, color: Color) -> some View {
        Text(text)
            .font(.mainTextSemiBold18)
            .foregroundColor(isSelected ? color : .gray02)
            .frame(maxWidth: .infinity, minHeight: 36)
            .background {
                Rectangle()
                    .fill(isSelected ? Color.white : Color.clear)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 1)
            }
    }
}
