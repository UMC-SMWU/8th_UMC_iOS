//
//  StoreGeoModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/13/25.
//

import Foundation


struct StoreFeatureCollection: Codable {
    let features: [StoreFeature]
}

struct StoreFeature: Codable {
    let properties: StoreProperties
    let geometry: StoreGeometry
}

struct StoreProperties: Codable {
    let sequence: String
    let storeName: String
    let address: String
    let telephone: String
    let category: String
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case sequence = "Seq"
        case storeName = "Store_nm"
        case address = "Address"
        case telephone = "Telephone"
        case category = "Category"
        case latitude = "Ycoordinate"
        case longitude = "Xcoordinate"
    }
}

struct StoreGeometry: Codable {
    let type: String
    let coordinates: [Double] // [longitude, latitude]
}
