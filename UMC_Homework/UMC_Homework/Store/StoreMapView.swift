import SwiftUI
import MapKit
import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

struct StoreMapView: View {
    let stores: [StarbucksStore]
    let userLocation: CLLocation?

    @State private var region: MKCoordinateRegion
    @State private var movedCamera = false
    @State private var showSearchButton = false

    init(stores: [StarbucksStore], userLocation: CLLocation?) {
        // 지도 초기 위치 설정
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: userLocation?.coordinate.latitude ?? 37.5665,
                longitude: userLocation?.coordinate.longitude ?? 126.9780
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
        self.stores = stores
        self.userLocation = userLocation
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            // 지도 뷰: 매장들 마커 표시
            Map(coordinateRegion: $region, annotationItems: stores) { store in
                MapMarker(
                    coordinate: CLLocationCoordinate2D(latitude: store.latitude, longitude: store.longitude),
                    tint: .green
                )
            }

//            // 사용자 현재 위치 마커
//            Group {
//                if let user = userLocation {
//                    MapMarker(coordinate: user.coordinate, tint: .blue)
//                }
//            }

            // "이 지역 검색" 버튼
            if showSearchButton {
                Button("이 지역 검색") {
                    // 이 버튼 클릭 시 10km 내 매장 다시 필터링 등 기능 구현 예정
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 3)
                .padding()
            }
        }
        // 지도 중심 이동 감지
        .onChange(of: region.center) { _ in
            movedCamera = true
            showSearchButton = true
        }
    }
}

