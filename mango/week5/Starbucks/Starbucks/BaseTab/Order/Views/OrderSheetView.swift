//
//  OrderSheetView.swift
//  Starbucks
//
//  Created by 엄민서 on 4/13/25.
//

import SwiftUI
import MapKit

enum StoreSegment: String, CaseIterable, Identifiable {
    case nearby = "가까운 매장"
    case frequent = "자주 가는 매장"

    var id: String { self.rawValue }
}

struct OrderSheetView: View {
    @Environment(StoreViewModel.self) var storeViewModel
    @State private var isMapMode = false
    @State private var selectedSegment: StoreSegment = .nearby
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    var body: some View {
        VStack(spacing: 0) {
            topNavigation
            searchBar
            storeSegment

            Divider()
            
            storeList
            
        }

        .task {
            // 강제 초기화
            _ = LocationManager.shared

            // 위치 들어올 때까지 기다리기
            while LocationManager.shared.currentLocation == nil {
                try? await Task.sleep(nanoseconds: 300_000_000)
            }

            if let current = LocationManager.shared.currentLocation {
                await storeViewModel.loadStores(from: current)
                region.center = current.coordinate
            }
        }
    }
    
    private var topNavigation: some View {
        ZStack {
            Text("매장 설정")
                .foregroundStyle(Color.black03)
                .font(.mainTextMedium16)
                .kerning(-0.05)
            
            HStack {
                Spacer()
                Button {
                    isMapMode.toggle()
                } label: {
                    Image(systemName: isMapMode ? "list.bullet" : "map")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(Color.gray04)
                }
                .padding(.trailing, 32)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 39)
        .padding(.bottom, 24)
    }

    private var searchBar: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width:375, height: 27)
                .foregroundStyle(Color.gray12)
            
            Text("검색")
                .foregroundStyle(Color.gray13)
                .font(.mainTextSemiBold12)
                .padding(.leading, 7)
        }
        .padding(.horizontal, 32)
    }

    private var storeSegment: some View {
        HStack(spacing: 8) {
            Button {
                withAnimation { selectedSegment = .nearby }
            } label: {
                Text("가까운 매장")
                    .foregroundColor(selectedSegment == .nearby ? .black03 : .gray03)
                    .font(selectedSegment == .nearby ? .mainTextSemiBold13 : .mainTextRegular13)
            }

            Rectangle()
                .frame(width: 1, height: 12)
                .foregroundColor(.gray02)
            
            
            Button {
                withAnimation { selectedSegment = .frequent }
            } label: {
                Text("자주 가는 매장")
                    .foregroundColor(selectedSegment == .frequent ? .black03 : .gray03)
                    .font(selectedSegment == .frequent ? .mainTextSemiBold13 : .mainTextRegular13)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 24)
        .padding(.bottom, 18)
        .padding(.leading, 32)
    }
    
    @ViewBuilder
    private var storeList: some View {
        if isMapMode {
            StoreMapView(
                region: $region,
                allStores: storeViewModel.nearbyStores
            )
        } else {
            ScrollView {
                LazyVStack(spacing: 16) {
                    let storeList = selectedSegment == .nearby
                        ? storeViewModel.nearbyStores
                        : storeViewModel.frequentStores

                    ForEach(storeList) { store in
                        StoreListCard(store: store)
                    }
                }
                .padding(.top, 28)
                .padding(.horizontal, 32)
            }
        }
    }
}
