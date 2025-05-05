import SwiftUI

struct OtherView: View {
    @ObservedObject var viewModel = OtherViewModel()

    var body: some View {
        VStack(spacing: 0) {
            /// 상단 섹션
            HStack {
                Text("Other")
                    .font(.mainTextBold24)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    print("로그아웃")
                }) {
                    Image("logout")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(Color.white)
            
            Spacer()
            
            /// 나머지
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 닉네임과 환영 메시지
                    Text("(\(viewModel.nickname))님\n환영합니다")
                        .multilineTextAlignment(.center)
                        .font(.mainTextSemibold24)

                    // 버튼 섹션
                    HStack(spacing: 20) {
                        CustomButton(menuImage: "starHistory", title: "별 히스토리", destination: HomeView())
                        CustomButton(menuImage: "receipt", title: "전자 영수증", destination: HomeView())
                        CustomButton(menuImage: "my", title: "나만의 메뉴", destination: HomeView())
                    }

                    // Pay 섹션
                    Text("Pay")
                        .font(.mainTextSemiBold18)

                    HStack(spacing: 10) {
                        CustomSectionButton(leftImage: "card", text: "스타벅스 카드 등록", action: {})
                        CustomSectionButton(leftImage: "cardChange", text: "카드 교환권 등록", action: {})
                    }

                    HStack(spacing: 50) {
                        CustomSectionButton(leftImage: "coupon", text: "쿠폰 등록", action: {})
                        CustomSectionButton(leftImage: "conponHistory", text: "쿠폰 히스토리", action: {})
                    }

                    // 고객지원 섹션
                    Text("고객지원")
                        .font(.mainTextSemiBold18)

                    HStack(spacing: 50) {
                        CustomSectionButton(leftImage: "storeCare", text: "스토어 케어", action: {})
                        CustomSectionButton(leftImage: "customer", text: "고객의 소리", action: {})
                    }

                    HStack(spacing: 50) {
                        CustomSectionButton(leftImage: "storeInfo", text: "매장 정보", action: {})
                        CustomSectionButton(leftImage: "returnInfo", text: "반납기 정보", action: {})
                    }

                    HStack(spacing: 10) {
                        CustomSectionButton(leftImage: "myReview", text: "마이 스타벅스 리뷰", action: {})
                        Spacer()
                    }
                }
                .padding()
                .background(.white01)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    /// 커스텀 버튼
    struct CustomButton<Destination: View>: View {
        var menuImage: String
        var title: String
        var destination: Destination

        var body: some View {
            NavigationLink(destination: destination) {
                VStack {
                    Image(menuImage)
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.black03)
                    Text(title)
                        .font(.mainTextLight14)
                        .foregroundColor(.black)
                }
                .frame(width: 102, height: 108)
                .padding()
                .background(.white)
                .cornerRadius(15)
            }
        }
    }

    /// 커스텀 섹션 버튼
    struct CustomSectionButton: View {
        var leftImage: String
        var text: String
        var action: () -> Void

        var body: some View {
            Button(action: action) {
                HStack {
                    Image(leftImage)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                    Text(text)
                        .font(.mainTextSemibold16)
                        .foregroundColor(.black)
                }
                .padding()
            }
        }
    }
}

struct OtherView_Preview: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}

