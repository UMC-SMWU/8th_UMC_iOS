import SwiftUI

struct OrderStoreView: View {
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            Button(action: {
                isSheetPresented = true
            }) {
                HStack {
                    Text("주문할 매장을 선택해 주세요")
                        .foregroundColor(.white)
                        .font(.mainTextSemiBold14)
                    Spacer()
                    Image(systemName: "chevron.up")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.black)
            }
        }
    }
}

//struct OrderStoreView_Preview: PreviewProvider {
//    static var previews: some View {
//        OrderStoreView()
//    }
//}
