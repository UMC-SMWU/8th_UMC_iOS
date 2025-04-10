//
//  ReceiptDataCard.swift
//  Starbucks
//
//  Created by 엄민서 on 4/7/25.
//

import SwiftUI

struct ReceiptDataCard: View {
    let receipt: ReceiptModel
    @Binding var showImage: UIImage?

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 9) {
                Text(receipt.place)
                    .foregroundStyle(Color.black00)
                    .font(.mainTextSemiBold18)
                Text(receipt.date.toFormattedString())
                    .foregroundStyle(Color.gray03)
                    .font(.mainTextMedium16)
                Text("\(receipt.price)원")
                    .foregroundStyle(Color.brown02)
                    .font(.mainTextSemiBold18)
            }
            .padding(.leading, -19)

            Spacer()

            if let image = receipt.uiImage {
                Button {
                    print("버튼 클릭됨")
                    showImage = image
                } label: {
                    Image("dollaricon")
                        .resizable()
                        .frame(width: 16, height: 20)
                        .padding(10)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
    }
}
