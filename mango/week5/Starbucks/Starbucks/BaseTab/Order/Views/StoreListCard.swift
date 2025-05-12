//
//  StoreListCard.swift
//  Starbucks
//
//  Created by 엄민서 on 4/13/25.
//

import SwiftUI

struct StoreListCard: View {
    let store: StoreModel

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(store.imageName ?? "starbucksstore")
                .resizable()
                .frame(width: 83, height: 83)
                .clipShape(RoundedRectangle(cornerRadius: 6))

            VStack(alignment: .leading, spacing: 3) {
                
                Text(store.name)
                    .foregroundStyle(Color.black03)
                    .font(.mainTextSemiBold13)
                
                Text(store.roadAddress ?? store.address)
                    .foregroundColor(Color.gray02)
                    .font(.mainTextMedium10)
                
                HStack {
                    if let tagImage = store.category.tagImageName {
                        Image(tagImage)
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                    Spacer()
                    if let distance = store.distanceFromUser {
                        Text(String(format: "%.1f km", distance))
                            .foregroundColor(Color.black01)
                            .font(.mainTextMedium12)
                    }
                }
                .padding(.top, 15)
            }
            .padding(.top, 6)
            Spacer()
        }
    }
}
