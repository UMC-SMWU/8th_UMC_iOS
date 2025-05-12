//
//  NewProductsModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/6/25.
//

import SwiftUI
import Foundation

struct NewProductsModel: Identifiable {
    let id = UUID()
    var image: Image
    var name: String
}
