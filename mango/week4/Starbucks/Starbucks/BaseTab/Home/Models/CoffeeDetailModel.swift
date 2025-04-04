//
//  CoffeeDetailModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI
import Foundation

struct CoffeeDetailModel: Identifiable, ItemPresentable {
    let id = UUID()
    var image: Image
    var squareImage: Image
    var name: String
    var enName: String
    var content: String
    var price: String
    var bothTemps: Bool
    var temp: CoffeeTemp
}

enum CoffeeTemp: CaseIterable {
    case hot
    case iced
}

