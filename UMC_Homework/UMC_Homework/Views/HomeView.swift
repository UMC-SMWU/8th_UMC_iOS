import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopGroup
                MiddleGroup
                //MenuGroup
                PromotionGroup
                MembershipGroup
                EventGroup
                BottomGroup
            }
        }
    }
}

/// 상단 배너
private var TopGroup: some View {
    ZStack(alignment: .topLeading) {
        GeometryReader { geometry in
            ZStack(alignment : .leading) {
                Image(.topImg)
                    .resizable()
                    .frame(width: geometry.size.width, height: 226)
                
                VStack(alignment: .leading) {
                    Text("골든 미모사 그린 티와 함께")
                    Text("행복한 새해의 축배를 들어요!")
                }
                .font(.mainTextBold20)
                .foregroundColor(.black)
                .padding(.top)
                .padding(.leading)
                
                /// 별 게이지
                VStack {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            HStack (alignment: .center) {
                                Text("11")
                                // .font()
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow) // brown02로 변경
                                Text("until next Reward")
                                // .font()
                            }
                            ProgressView(value: 0.1)
                                .progressViewStyle(LinearProgressViewStyle(tint: .yellow)) // brown02로 변경
                                .frame(width: geometry.size.width * 0.5)
                        }
                        .frame(width: 255)
                        Text("1/20")
                            // .font()
                    }
                    .padding()
                }
            }
        }
        .frame(height: 226)
    }
}

/// 곰돌이 광고 배너
private var MiddleGroup: some View {
    Image(.homeAd)
}

/// 메뉴 추천
struct MenuGroup: View {
    @ObservedObject var Model: RecommendedMenuViewModel
    var nickname: String

    var body: some View {
    VStack(alignment: .leading) {
        Text("\(nickname)님을 위한 추천 메뉴")
            .font(.headline)
            .padding(.leading, 16)

        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                // ForEach(viewModel.recommendedMenus) { menu in
                    // CircleImageCard(menu: menu)
                }
            }
            .padding(.horizontal)
        }
    }
}

/// 프로모션 섹션
private var PromotionGroup: some View {
    VStack {
        Text("프로모션 정보")
    }
}

/// 멤버십 정보 섹션
private var MembershipGroup: some View {
    VStack {
        Text("멤버십 정보")
    }
}

/// 이벤트 섹션
private var EventGroup: some View {
    VStack {
        Text("이벤트 정보")
    }
}

/// 하단 정보 섹션
private var BottomGroup: some View {
    VStack {
        Text("하단 정보")
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
