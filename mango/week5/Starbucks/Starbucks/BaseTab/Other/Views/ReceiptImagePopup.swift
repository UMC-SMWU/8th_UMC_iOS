//
//  ReceiptImagePopup.swift
//  Starbucks
//
//  Created by 엄민서 on 4/7/25.
//

import SwiftUI

struct ReceiptImagePopup: View {
    let image: UIImage
    let onClose: () -> Void

    var body: some View {
        ZStack {
            Color.black00.opacity(0.8)
                .ignoresSafeArea()

            VStack {
                Spacer()

                ZStack(alignment: .topTrailing) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 800)
                        .padding()

                    Button(action: onClose) {
                        Image("closebutton")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .padding(8)
                    }
                    .padding(.top, 16)
                    .padding(.trailing, 16)
                }

                Spacer()
            }
        }
        .transition(.opacity)
        .animation(.easeInOut, value: image)
    }
}
