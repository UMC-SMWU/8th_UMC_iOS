import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = OrderCoffeeViewModel()
    @Namespace private var animation

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text("Order")
                    .font(.mainTextBold24)
                    .foregroundColor(.black)

                OrderTopSegmentView(selectedSegment: $viewModel.selectedSegment, animation: animation)
                OrderBottomSegmentView(selectedFilter: $viewModel.selectedFilter)
            }
            .padding()
            .background(Color.white)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.coffeeItems) { item in
                        OrderCoffeeView(item: item)
                    }
                }
                .padding(.top, 32)
            }
        }
    }
}

struct OrderView_Preview: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
