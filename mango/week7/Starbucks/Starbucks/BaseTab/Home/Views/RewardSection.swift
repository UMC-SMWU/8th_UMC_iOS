//
//  RewardSection.swift
//  Starbucks
//
//  Created by 엄민서 on 4/4/25.
//

import SwiftUI

struct RewardSection: View {
    let currentStars: Int
    let goalStars: Int

    private var progress: CGFloat {
        CGFloat(currentStars) / CGFloat(goalStars)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                .foregroundStyle(Color.black03)
                .font(.mainTextBold24)
                .padding(.top, 120)
            
            HStack(alignment: .bottom) {
                rewardGaugeBar

                Spacer()
                
                VStack(spacing: 3) {
                    detailButton
                    rewardStarCount
                }
            }
        }
    }

    private var rewardGaugeBar: some View {
        VStack(alignment: .leading) {
            Text("\(goalStars - currentStars)★ until next Reward")
                .foregroundStyle(Color.brown02)
                .font(.mainTextSemiBold16)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray10)
                    .frame(height: 8)

                Capsule()
                    .fill(Color.brown01)
                    .frame(width: 200 * progress, height: 8)
                    .animation(.easeInOut(duration: 0.3), value: progress)
            }
        }
        .frame(maxWidth: 256, maxHeight: 35)
        .padding(.top, 29)
    }

    private var detailButton: some View {
        Button(action: {
            print("내용 보기")
        }, label: {
            HStack(alignment: .center, spacing: 4) {
                Text("내용 보기")
                    .foregroundStyle(Color.gray06)
                    .font(.mainTextRegular13)
                
                Image("arrowicon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
            }
        })
    }
    
    private var rewardStarCount: some View {
        HStack(spacing: 5) {
            Text("\(currentStars)")
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold38)

            Text("/")
                .foregroundStyle(Color.gray08)
                .font(.mainTextLight24)

            HStack(alignment: .bottom, spacing: 0) {
                Text("\(goalStars)")
                    .foregroundStyle(Color.brown02)
                    .font(.mainTextSemiBold24)

                Text("★")
                    .foregroundStyle(Color.brown02)
                    .font(.mainTextSemiBold16)
                    .padding(.bottom, 2)
            }
        }
    }
}
