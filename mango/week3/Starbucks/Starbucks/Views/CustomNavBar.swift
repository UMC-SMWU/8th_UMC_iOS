//
//  CustomNavBar.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct CustomNavBar: View {
    let viewTitle: String
    let backButton: (() -> Void)
        
    init(viewTitle: String, backButton: @escaping (() -> Void)) {
        self.viewTitle = viewTitle
        self.backButton = backButton
    }
    
    var body: some View {
        HStack {
            Button(action : {
                backButton()
            }) {
                Image("backbutton")
                    .foregroundStyle(.black)
                    .frame(width: 24, height: 24)
            }
            Spacer()
            Text(viewTitle)
                .font(.mainTextMedium16)
            Spacer()
            Rectangle()
                .fill(.clear)
                .frame(width: 24, height: 24)
        }
        .padding(.horizontal, 19)
    }
}
