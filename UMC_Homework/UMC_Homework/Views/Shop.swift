import SwiftUI

struct ShopView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                OnlineStoreGroup
                AllGroup
                BestGroup
                NewGroup
            }
        }
    }
}

/// 스타벅스 온라인 스토어 섹션
private var OnlineStoreGroup: some View {
    Text("Starbucks Online Store")
        .font(.mainTextBold24)
        .multilineTextAlignment(.leading)
}

/// All 섹션
private var AllGroup: some View {
    VStack {
        Text("All Products")
            .font(.mainTextBold24)
            .multilineTextAlignment(.leading)
        Image(.homeAd)
    }
}

/// Best 섹션
private var BestGroup: some View {
    VStack {
        Text("Best Items")
            .font(.mainTextBold24)
            .multilineTextAlignment(.leading)

        HStack(spacing: 50) {
            shopImage(menuImage: "storeCare", title: "그린 사이렌 슬리브 머그", text: "355ml", action: {})
            shopImage(menuImage: "storeCare", title: "그린 사이렌 클래식 머그", text: "355ml", action: {})
        }

        HStack(spacing: 50) {
            shopImage(menuImage: "storeCare", title: "사이렌 머그 앤 우드 소서", text: " ", action: {})
            shopImage(menuImage: "storeCare", title: "리저브 골드 테일 머그", text: "355ml", action: {})
        }
    }
}

/// New 섹션
private var NewGroup: some View {
    VStack {
        Text("New Products")
            .font(.mainTextBold24)
            .multilineTextAlignment(.leading)

        HStack(spacing: 50) {
            shopImage(menuImage: "storeCare", title: "그린 사이렌 도트 머그", text: "237ml", action: {})
            shopImage(menuImage: "storeCare", title: "그린 사이렌 클래식 머그", text: "355ml", action: {})
        }

        HStack(spacing: 50) {
            shopImage(menuImage: "storeCare", title: "홈 카페 미니 머그 세트", text: " ", action: {})
            shopImage(menuImage: "storeCare", title: "홈 카페 글라스 세트", text: " ", action: {})
        }
    }
}


///
///

struct shopImage: View {
    var menuImage: String
    var title: String
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(menuImage)
                    .resizable()
                    .frame(width: 157, height: 156)
                    .foregroundColor(.black03)
                Text(title)
                    .font(.mainTextLight14)
                    .foregroundColor(.black)
                Text(text)
                    .font(.mainTextLight14)
                    .foregroundColor(.black)
            }
            .frame(width: 157, height: 208)
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }
}

struct ShopView_Preview: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}

