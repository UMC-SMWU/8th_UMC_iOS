import Foundation
import CoreLocation

enum StoreCategory: String, Codable {
    case reserve = "리저브"
    case dt = "DT"
    case none = ""
}

struct StarbucksStore: Identifiable, Codable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let category: [StoreCategory]
    
    var imageName: String = "store_placeholder"
    var distance: Double?
    
    var formattedDistance: String {
        guard let distance = distance else { return "-" }
        return String(format: "%.1fkm", distance / 1000)
    }
}

