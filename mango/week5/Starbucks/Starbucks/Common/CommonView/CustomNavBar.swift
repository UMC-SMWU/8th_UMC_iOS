//
//  CustomNavBar.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct CustomNavBar: View {
    let viewTitle: String
    var showBackButton: Bool = true
    var showPlusButton: Bool = false
    var backAction: (() -> Void)? = nil
    var plusAction: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            
            if showBackButton {
                Button(action: {
                    backAction?()
                }) {
                    Image("backbutton")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 10, height: 16)
                }
            } else {
                Spacer().frame(width: 16)
            }
            
            Spacer()
            
            Text(viewTitle)
                .font(.mainTextMedium16)
            
            Spacer()
            
            if showPlusButton {
                Button(action: {
                    plusAction?()
                }) {
                    Image("plusbutton")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 16, height: 16)
                }
            } else {
                Spacer().frame(width: 16)
            }
            
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
        .padding(.bottom, 22)
        .background(Color.white00)
        .frame(maxWidth: .infinity, minHeight: 96)
    }
}
