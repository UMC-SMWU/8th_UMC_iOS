//
//  TempTag.swift
//  Starbucks
//
//  Created by 엄민서 on 4/5/25.
//

import SwiftUI

struct TempTag: View {
    let temp: CoffeeTemp

    var body: some View {
        Text(temp == .hot ? "HOT ONLY" : "ICED ONLY")
            .foregroundColor(temp == .hot ? .red01 : .blue01)
            .font(.mainTextBold15)
            .kerning(-0.3)
            .frame(maxWidth: .infinity, minHeight: 36)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.white00)
                    .stroke(Color.gray11)
            }
    }
}
