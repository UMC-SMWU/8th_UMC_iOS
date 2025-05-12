//
//  OrderView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct OrderView: View {
    
    @Namespace private var animation
    @Environment(OrderViewModel.self) var orderviewModel
    @State private var showSheet = false

    var body: some View {
        VStack(alignment: .leading) {
            titleView
            topSegmentView
            
            if orderviewModel.selectedTop == .allmenu {
                bottomSegmentView
                Divider()
                contentView
            } else {
                ScrollView {
                    VStack(spacing: 12) {
                        Spacer(minLength: 100)
                        Text("")
                            .font(.mainTextMedium16)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            
            sheetView
        }
    }
    
    private var titleView: some View {
        Text("Order")
            .foregroundStyle(Color.black03)
            .font(.mainTextSemiBold24)
            .padding(.leading, 23)
            .padding(.bottom, 6)
    }
    
    private var topSegmentView: some View {
        HStack(spacing: 0) {
            ForEach(TopSegment.allCases) { segment in
                Button {
                    withAnimation(.spring()) {
                        orderviewModel.selectedTop = segment
                    }
                } label: {
                    VStack(spacing: 12) {
                        Text(segment.title)
                            .foregroundColor(orderviewModel.selectedTop == segment ? .black : .gray04)

                            .font(.mainTextBold16)
                        if orderviewModel.selectedTop == segment {
                            Color.green01
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "topSegment", in: animation)
                        } else {
                            Color.clear.frame(height: 3)
                        }
                    }
                    .frame(maxWidth: 120, alignment: .center)
                }
            }
            Spacer().frame(width: 50)

            Button(action: {
                print("홀케이크 예약 버튼")
            }) {
                HStack(spacing: 4) {
                    Image("wholecake")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("홀케이크 예약")
                        .foregroundStyle(Color.green01)
                        .font(.mainTextBold16)
                }
                .frame(maxWidth: 120)
                .padding(.bottom, 13)
            }
            Spacer().frame(width: 27)

        }
        .frame(maxWidth: .infinity)
        .padding(.top, 13)
        .background(
            Color.white
                .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 3)
        )
    }
    
    private var bottomSegmentView: some View {
        HStack {
            ForEach(BottomSegment.allCases) { segment in
                Button {
                    orderviewModel.selectedBottom = segment
                } label: {
                    HStack(spacing: 2) {
                        Text(segment.title)
                            .foregroundColor(orderviewModel.selectedBottom == segment ? .black01 : .gray04)
                            .font(.mainTextMedium16)
                        Image("new")
                    }
                    .padding(.horizontal, 6)
                    .padding(.top, 18)
                    .padding(.bottom, 12)
                }
            }
        }
        .padding(.leading, 23)
        .padding(.top, 6)
    }
    
    private var contentView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 26) {
                ForEach(orderviewModel.filteredItems) { item in
                    MenuListCard(menu: item)
                }
            }
            .padding(.top, 16)
        }
    }
    
    private var sheetView: some View {
        VStack(spacing: 7) {
            HStack {
                Text("주문할 매장을 선택해 주세요")
                    .foregroundStyle(Color.white00)
                    .font(.mainTextSemiBold16)
                
                Spacer()
                
                Button {
                    showSheet = true
                } label: {
                    Image("arrowdownicon")
                        .resizable()
                        .frame(width: 11, height: 5.5)
                        .sheet(isPresented: $showSheet) {
                            OrderSheetView()
                                .presentationDragIndicator(.visible)
                        }
                }
            }
            .padding(.horizontal, 20)

            Rectangle()
                .fill(Color.gray06)
                .frame(height: 1)
                .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(Color.black02)
    }
}

#Preview {
    OrderView()
}
