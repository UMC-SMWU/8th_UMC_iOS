//
//  BreadDetailModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/4/25.
//

import SwiftUI
import Foundation

struct BreadDetailModel: Identifiable, ItemPresentable {
    let id = UUID()
    var image: Image
    var name: String
}
