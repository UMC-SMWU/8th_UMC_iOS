import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color(.green00)
                .ignoresSafeArea() // 전체 화면으로
            Image(.starbucksLogo)
        }

    }
}

struct SwiftUIView_Preview: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
