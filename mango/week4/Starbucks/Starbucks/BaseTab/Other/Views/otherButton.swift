//
//  otherButton.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct otherButton: View {
    let icon: Image
    let title: String
    let action: () -> Void
    
    init(icon: Image, title: String, action: @escaping () -> Void = {}) {
        self.icon = icon
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white00)
                .frame(width: 102, height: 108)
                .shadow(color: Color.black00.opacity(0.1), radius: 5, x: 0, y: 0)
                .overlay(content: {
                    VStack(spacing: 4) {
                        icon
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(Color.green01)
                        
                        Text(title)
                            .font(.mainTextSemiBold16)
                            .foregroundStyle(Color.black03)
                    }
                })
        }
    }
}
