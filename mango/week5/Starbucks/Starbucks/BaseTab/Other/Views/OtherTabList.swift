//
//  OtherTabList.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct OtherTabList: View {
    let icon: Image
    let title: String
    let action: () -> Void

    init(icon: Image, title: String, action: @escaping () -> Void = {}) {
        self.icon = icon
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            print(title)
            action()
        }, label: {
            HStack(spacing: 8) {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 32, maxHeight: 32)
                Text(title)
                    .font(.mainTextSemiBold16)
                
                Spacer()
            }
            .foregroundStyle(Color.black02)
        })
    }
}
