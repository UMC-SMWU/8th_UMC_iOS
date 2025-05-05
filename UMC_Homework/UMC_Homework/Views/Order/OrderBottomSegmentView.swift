import SwiftUI

enum OrderBottomSegment: String, CaseIterable {
    case drink = "음료"
    case food = "푸드"
    case goods = "상품"
}

struct OrderBottomSegmentView: View {
    @Binding var selectedFilter: OrderBottomSegment

    var body: some View {
        HStack(spacing: 8) {
            ForEach(OrderBottomSegment.allCases, id: \.self) { filter in
                segmentButton(for: filter)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 23)
    }

    @ViewBuilder
    private func segmentButton(for filter: OrderBottomSegment) -> some View {
        let isSelected = selectedFilter == filter

        Button(action: {
            selectedFilter = filter
        }) {
            Text(filter.rawValue)
                .font(.mainTextSemiBold14)
                .foregroundColor(isSelected ? .black : .gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
        }
        .buttonStyle(.plain)
    }
}

