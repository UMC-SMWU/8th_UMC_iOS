import Foundation
import CoreLocation

class StoreViewModel: ObservableObject {
    @Published var allStores: [StarbucksStore] = []
    @Published var nearbyStores: [StarbucksStore] = []
    
    func loadStores(userLocation: CLLocation?) {
        guard let url = Bundle.main.url(forResource: "starbucks", withExtension: "geojson"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([StarbucksStore].self, from: data)
        else { return }

        allStores = decoded
        
        guard let location = userLocation else {
            nearbyStores = decoded
            return
        }
        
        // 거리계산 & 10km 필터링
        nearbyStores = decoded.compactMap { store in
            let storeLoc = CLLocation(latitude: store.latitude, longitude: store.longitude)
            let distance = storeLoc.distance(from: location)
            guard distance <= 10_000 else { return nil }
            var s = store
            s.distance = distance
            return s
        }
        .sorted(by: { ($0.distance ?? 0) < ($1.distance ?? 0) })
    }
}

