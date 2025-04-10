//
//  otherList.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct otherList: View {
    let icon: Image
    let title: String
    
    init(icon: Image, title: String) {
        self.icon = icon
        self.title = title
    }
    
    var body: some View {
        Button(action: {
            print(title)
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
