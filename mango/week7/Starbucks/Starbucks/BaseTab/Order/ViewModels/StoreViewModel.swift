//
//  StoreViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/13/25.
//

import Foundation
import CoreLocation
import Observation

@Observable
class StoreViewModel {
    var nearbyStores: [StoreModel] = []
    var frequentStores: [StoreModel] = []
    
    func loadStores(from location: CLLocation) async {
        guard let url = Bundle.main.url(forResource: "starbucks", withExtension: "geojson") else { return }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(StoreFeatureCollection.self, from: data)

            let stores: [StoreModel] = decoded.features.map { feature in
                let prop = feature.properties
                let coord = CLLocationCoordinate2D(latitude: prop.latitude, longitude: prop.longitude)
                let category = StoreCategory(rawValue: prop.category) ?? .none

                return StoreModel(
                    id: UUID(),
                    name: prop.storeName,
                    address: prop.address,
                    phone: prop.telephone,
                    coordinate: coord,
                    category: category,
                    distanceFromUser: nil,
                    roadAddress: nil,
                    imageName: "starbucksstore",
                    isCurrentUser: false
                )
            }

            self.nearbyStores = stores
                .map { store in
                    var copy = store
                    let distance = location.distance(from: CLLocation(latitude: store.coordinate.latitude, longitude: store.coordinate.longitude)) / 1000
                    copy.distanceFromUser = distance
                    return copy
                }
                .filter { $0.distanceFromUser ?? 0 < 10 }
                .sorted { ($0.distanceFromUser ?? 0) < ($1.distanceFromUser ?? 0) }

        } catch {
            print("GeoJSON 로딩 에러: \(error)")
        }
    }
}
