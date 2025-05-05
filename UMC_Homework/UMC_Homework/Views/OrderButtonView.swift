import SwiftUI

struct OrderButtonView: View {
    var body: some View {
        Button(action: {
            print("주문하기")
        }) {
            Text("주문하기")
                .foregroundColor(.white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.green00)
                .cornerRadius(12)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
