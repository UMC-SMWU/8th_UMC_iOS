import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = WhatsNewViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TopGroup
                MiddleGroup
                //MenuGroup
                PromotionGroup
                WhatsNewGroup(viewModel: viewModel)
                EventGroup
                BottomGroup
                BottomBennerGroup
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
                                    .font(.mainTextSemibold16)
                                    .foregroundColor(.brown02)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.brown02)
                                Text("until next Reward")
                                    .font(.mainTextSemibold16)
                                    .foregroundColor(.brown02)
                            }
                            ProgressView(value: 0.1)
                                .progressViewStyle(LinearProgressViewStyle(tint: .brown02))
                                .frame(width: geometry.size.width * 0.5)
                        }
                        .frame(width: 255)
                        Text("1/20")
                            .font(.mainTextSemiBold38)
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
                    ForEach(Model.recommendedMenus) { menu in
                        CircleImageCard(menu: menu)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

/// 프로모션 섹션
private var PromotionGroup: some View {
    VStack {
        Image(.bannerEvent)
        Image(.serviceSuscibe)
    }
    .padding()
}

/// What's New 섹션
struct WhatsNewGroup: View {
    @ObservedObject var viewModel: WhatsNewViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("What's New")
                .font(.mainTextBold24)
                .padding(.horizontal, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.items) { item in
                        VStack(alignment: .leading) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()

                            Text(item.title)
                                .font(.subheadline)
                                .bold()
                            Text(item.subtitle)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .frame(width: 200)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

/// 배너 섹션
private var EventGroup: some View {
    Image(.bannerMiddle)
}

/// 하루가 달콤해지는 디저트 섹션
private var BottomGroup: some View {
    VStack {
        Text("하단 정보")
    }
}

/// 하단 배너 섹션
private var BottomBennerGroup: some View {
    VStack {
        Image(.bannerColdbrew)
        Image(.bannerDrink)
        Image(.serviceSuscibe)
    }
    .padding()
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
