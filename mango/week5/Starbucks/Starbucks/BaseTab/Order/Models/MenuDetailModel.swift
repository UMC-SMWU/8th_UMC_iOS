//
//  MenuDetailModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/11/25.
//

import SwiftUI
import Foundation

struct MenuDetailModel: Identifiable, ItemPresentable {
    let id = UUID()
    var image: Image
    var name: String
    var enName: String
    var showDot: Bool
}

