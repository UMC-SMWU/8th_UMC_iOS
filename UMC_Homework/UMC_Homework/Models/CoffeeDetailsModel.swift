import Foundation

struct CoffeeDetailsModel: Identifiable {
    let id = UUID()
    let nameKR: String
    let nameEN: String
    let description: String
    let price: String
    let imageName: String
    let temperatureOptions: [TemperatureType]
}

