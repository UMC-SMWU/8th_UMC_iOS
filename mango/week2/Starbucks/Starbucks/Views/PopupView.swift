//
//  PopupView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct PopupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image("ad")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 720)
                .ignoresSafeArea(edges: .top)
            
            detailButton
            closeButton
        }
        .padding(.bottom, 36)
    }
    
    private var detailButton: some View {
        Button(action: {
            print("자세히 보기")
        }, label: {
            Text("자세히 보기")
                .font(.mainTextMedium16)
                .foregroundStyle(.white)
                .frame(maxWidth: 402, maxHeight: 58)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green01)
                )
        })
        .padding(.horizontal, 18)
    }
    
    private var closeButton: some View {
        HStack {
            Spacer()
            Button(action: {
                print("닫기 버튼 클릭")
                dismiss()
            }, label: {
                Text("X 닫기")
                    .font(.mainTextLight14)
                    .foregroundStyle(Color.gray05)
            })
        }
        .padding(.top, 19)
        .padding(.trailing, 37)
    }
}

#Preview {
    PopupView()
}
