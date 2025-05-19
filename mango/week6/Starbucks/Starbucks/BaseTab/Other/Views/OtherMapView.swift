//
//  OtherMapView.swift
//  Starbucks
//
//  Created by 엄민서 on 4/20/25.
//

import SwiftUI
import MapKit

enum StoreSearchSegment: String, CaseIterable, Identifiable {
    case store = "매장 찾기"
    case route = "길 찾기"

    var id: String { self.rawValue }
}

struct OtherMapView: View {
    @Environment(NavigationRouter.self) var router
    @Environment(StoreViewModel.self) var storeViewModel
    @Environment(LocationManager.self) var locationManager

    @State private var selectedSegment: StoreSearchSegment = .store
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        VStack(spacing: 0) {
            CustomNavBar(
                viewTitle: "매장 찾기",
                showBackButton: true,
                showPlusButton: false,
                backAction: { router.pop() },
                plusAction: {}
            )

            segmentSelector

            ZStack {
                if selectedSegment == .store {
                    StoreMapView(region: $region, allStores: storeViewModel.nearbyStores)
                } else {
                    Spacer()
                }

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            if let location = locationManager.currentLocation {
                                withAnimation {
                                    region.center = location.coordinate
                                }
                            }
                        } label: {
                            Image(systemName: "location.fill")
                                .foregroundStyle(.white)
                                .frame(width: 35, height: 35)
                                .background(Circle().fill(Color.blue))
                        }
                        .padding(.bottom, 32)
                        .padding(.trailing, 24)
                    }
                }
            }
        }
        .onAppear {
            if let current = locationManager.currentLocation {
                region.center = current.coordinate
            }
        }
    }

    private var segmentSelector: some View {
        HStack {
            ForEach(StoreSearchSegment.allCases) { segment in
                VStack {
                    Button {
                        withAnimation {
                            selectedSegment = segment
                        }
                    } label: {
                        Text(segment.rawValue)
                            .foregroundStyle(.black)
                            .font(.mainTextSemiBold24)
                    }

                    if selectedSegment == segment {
                        Rectangle()
                            .fill(Color.brown02)
                            .frame(width: 120, height: 5)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    } else {
                        Color.clear.frame(height: 5)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.bottom, 17)
    }
}
