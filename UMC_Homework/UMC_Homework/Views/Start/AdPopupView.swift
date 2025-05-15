import SwiftUI

struct AdPopupView: View {
    @Environment(\.dismiss) var dismiss // 닫기 버튼을 위한 dismiss 환경 변수
    
    var body: some View {
        VStack {
            Image(.ad)
                .resizable()
                .frame(width: 438, height: 720)
            
            VStack {
                    /// '자세히 보기' 버튼
                    Button(action: {
                        print("자세히 보기")
                    }) {
                        ZStack {
                            Image(.login)
                            Text("자세히 보기")
                                //.font()
                                .foregroundColor(.white)
                        }
                    Spacer()
                    
                    /// '닫기' 버튼
                    Button(action: {
                        dismiss()
                    }) {
                        Text("X 닫기")
                            //.font()
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct AdPopupView_Preview: PreviewProvider {
    static var previews: some View {
        AdPopupView()
    }
}
