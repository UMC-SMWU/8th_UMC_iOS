//
//  StoreModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/13/25.
//

import Foundation
import CoreLocation

struct StoreModel: Identifiable {
    let id: UUID
    let name: String
    let address: String
    let phone: String
    let coordinate: CLLocationCoordinate2D
    let category: StoreCategory
    var distanceFromUser: Double?
    var roadAddress: String?
    var imageName: String? = "starbucksstore"
    var isCurrentUser: Bool = false

    static func currentUserDummy(location: CLLocationCoordinate2D) -> StoreModel {
        return StoreModel(
            id: UUID(),
            name: "현재 위치",
            address: "",
            phone: "",
            coordinate: location,
            category: .none,
            distanceFromUser: nil,
            roadAddress: nil,
            imageName: nil,
            isCurrentUser: true
        )
    }
}

enum StoreCategory: String {
    case reserve = "리저브 매장"
    case dt = "DT 매장"
    case none = ""

    var tagImageName: String? {
        switch self {
        case .reserve: return "reservestore"
        case .dt: return "dtstore"
        case .none: return nil
        }
    }
}
