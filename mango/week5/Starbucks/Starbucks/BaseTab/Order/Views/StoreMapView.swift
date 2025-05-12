//
//  StoreMapView.swift
//  Starbucks
//
//  Created by 엄민서 on 4/13/25.
//

//import SwiftUI
//import MapKit
//import CoreLocation
//
//struct StoreMapView: View {
//    @Binding var region: MKCoordinateRegion
//    let allStores: [StoreModel]
//    let currentLocation: CLLocationCoordinate2D
//
//    @State private var filteredStores: [StoreModel] = []
//    @State private var isMapDragged = false
//    @State private var lastRegionCenter: CLLocationCoordinate2D? = nil
//
//    var body: some View {
//        Map(coordinateRegion: $region,
//            interactionModes: [.all],
//            showsUserLocation: false,
//            annotationItems: filteredStores + [StoreModel.currentUserDummy(location: currentLocation)]) { store in
//
//            MapAnnotation(coordinate: store.coordinate) {
//                if store.isCurrentUser {
//                    Image(systemName: "location.circle.fill")
//                        .resizable()
//                        .frame(width: 24, height: 24)
//                        .foregroundStyle(.blue)
//                } else {
//                    Image(systemName: "mappin.circle.fill")
//                        .resizable()
//                        .frame(width: 24, height: 24)
//                        .foregroundStyle(.green)
//                }
//            }
//        }
//        .onAppear {
//            filterStores()
//            lastRegionCenter = region.center
//        }
//        .onChange(of: region.center.latitude) { _ in
//            let current = region.center
//            if let last = lastRegionCenter {
//                if distanceBetween(current, last) > 20 {
//                    isMapDragged = true
//                }
//            }
//            lastRegionCenter = current
//        }
//        .overlay(alignment: .bottomTrailing) {
//            if isMapDragged {
//                Button(action: {
//                    filterStores()
//                    isMapDragged = false
//                }) {
//                    Text("이 지역 검색")
//                        .font(.system(size: 14, weight: .medium))
//                        .padding(8)
//                        .background(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 8))
//                        .shadow(radius: 2)
//                }
//                .padding()
//            }
//        }
//    }
//
//    private func filterStores() {
//        let centerLocation = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
//        filteredStores = allStores.filter { store in
//            let storeLocation = CLLocation(latitude: store.coordinate.latitude, longitude: store.coordinate.longitude)
//            let distance = centerLocation.distance(from: storeLocation) / 1000
//            return distance <= 10
//        }
//    }
//
//    private func distanceBetween(_ lhs: CLLocationCoordinate2D, _ rhs: CLLocationCoordinate2D) -> Double {
//        let loc1 = CLLocation(latitude: lhs.latitude, longitude: lhs.longitude)
//        let loc2 = CLLocation(latitude: rhs.latitude, longitude: rhs.longitude)
//        return loc1.distance(from: loc2)
//    }
//} 

import SwiftUI
import MapKit
import CoreLocation

struct StoreMapView: View {
    @Binding var region: MKCoordinateRegion
    let allStores: [StoreModel]
    
    @Environment(LocationManager.self) private var locationManager
    @Environment(StoreViewModel.self) private var storeViewModel
    
    @State private var currentLocation: CLLocationCoordinate2D = .init(latitude: 0, longitude: 0)
    @State private var filteredStores: [StoreModel] = []
    @State private var isMapDragged = false
    @State private var lastRegionCenter: CLLocationCoordinate2D? = nil

    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: [.all],
            showsUserLocation: false,
            annotationItems: filteredStores + [StoreModel.currentUserDummy(location: currentLocation)]) { store in

            MapAnnotation(coordinate: store.coordinate) {
                if store.isCurrentUser {
                    Image(systemName: "location.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.blue)
                } else {
                    Image("storeicon")
                        .resizable()
                        .frame(width: 30, height: 36)
                }
            }
        }
        .onAppear {
            if let initialLocation = locationManager.currentLocation {
                currentLocation = initialLocation.coordinate
                region.center = currentLocation
                filterStores()
            }
            lastRegionCenter = region.center
        }
        .onChange(of: locationManager.currentLocation) { newLocation in
            if let location = newLocation {
                currentLocation = location.coordinate
            }
        }
        .onChange(of: region.center.latitude) { _ in
            let current = region.center
            if let last = lastRegionCenter {
                if distanceBetween(current, last) > 20 {
                    isMapDragged = true
                }
            }
            lastRegionCenter = current
        }
        .overlay(alignment: .top) {
            if isMapDragged {
                Button(action: {
                    let center = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
                    Task {
                        await storeViewModel.loadStores(from: center)
                        filterStores()
                        isMapDragged = false
                    }
                }) {
                    Text("이 지역 검색")
                        .foregroundStyle(Color.gray06)
                        .font(.mainTextMedium13)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 3)
                        )
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 22)
            }
        }
    }

    private func filterStores() {
        let centerLocation = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
        filteredStores = storeViewModel.nearbyStores.filter { store in
            let storeLocation = CLLocation(latitude: store.coordinate.latitude, longitude: store.coordinate.longitude)
            let distance = centerLocation.distance(from: storeLocation) / 1000
            return distance <= 10
        }
    }

    private func distanceBetween(_ lhs: CLLocationCoordinate2D, _ rhs: CLLocationCoordinate2D) -> Double {
        let loc1 = CLLocation(latitude: lhs.latitude, longitude: lhs.longitude)
        let loc2 = CLLocation(latitude: rhs.latitude, longitude: rhs.longitude)
        return loc1.distance(from: loc2)
    }
}
