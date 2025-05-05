import SwiftUI

enum OrderTopSegment: String, CaseIterable {
    case allMenu = "전체 메뉴"
    case myMenu = "나만의 메뉴"
    case cakeReservation = "홀케이크 예약"
}

struct OrderTopSegmentView: View {
    @Binding var selectedSegment: OrderTopSegment
    var animation: Namespace.ID

    var body: some View {
        GeometryReader { geo in
            let totalWidth = geo.size.width
            let segmentWidth = totalWidth / CGFloat(OrderTopSegment.allCases.count)

            HStack(spacing: 0) {
                ForEach(OrderTopSegment.allCases, id: \.self) { segment in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedSegment = segment
                        }
                    } label: {
                        VStack(spacing: 8) {
                            Text(segment.rawValue)
                                .font(.mainTextMedium16)
                                .foregroundColor(.black)

                            ZStack {
                                Capsule()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 3)
                                    .shadow(color: Color.black.opacity(0.15), radius: 1.5, x: 0, y: 3)

                                if selectedSegment == segment {
                                    Capsule()
                                        .fill(Color.green01)
                                        .matchedGeometryEffect(id: "segment", in: animation)
                                        .frame(height: 3)
                                }
                            }
                        }
                        .frame(width: segmentWidth)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .frame(height: 60)
    }
}
