//
//  PageControl.swift
//  Starbucks
//
//  Created by 엄민서 on 4/6/25.
//

import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Capsule()
                    .stroke(Color.gray02, lineWidth: 1)
                    .fill(index == currentPage ? Color.black03 : Color.clear)
                    .frame(width: index == currentPage ? 8 : 8, height: 8)
                    .onTapGesture {
                        currentPage = index
                    }
            }
        }
    }
}
