//
//  MenuListCard.swift
//  Starbucks
//
//  Created by 엄민서 on 4/11/25.
//

import SwiftUI

struct MenuListCard: View {
    let menu: MenuDetailModel
        
    init(menu: MenuDetailModel) {
        self.menu = menu
    }
    
    var body: some View {
        HStack(spacing: 16) {
            menu.image
                .resizable()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 2) {
                    Text(menu.name)
                        .foregroundStyle(Color.gray06)
                        .font(.mainTextSemiBold16)
                    if menu.showDot {
                        Image("doticon")
                            .frame(width: 6, height: 6)
                            .padding(.bottom, 6)
                    }
                }
                Text(menu.enName)
                    .foregroundStyle(Color.gray03)
                    .font(.mainTextSemiBold13)
            }
            Spacer()
        }
        .padding(.leading, 23)
        .frame(maxWidth: .infinity, minHeight: 60)
    }
}
