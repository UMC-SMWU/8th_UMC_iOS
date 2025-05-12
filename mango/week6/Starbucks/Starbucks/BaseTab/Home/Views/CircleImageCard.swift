//
//  CircleImageCard.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct CircleImageCard: View {
    let model: ItemPresentable
        
    init(model: ItemPresentable) {
        self.model = model
    }
    
    var body: some View {
        VStack(spacing: 10) {
            model.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .clipShape(Circle())
            
            Text(model.name)
                .foregroundStyle(Color.black02)
                .font(.mainTextSemiBold14)
                .kerning(-0.3)
        }
    }
}
