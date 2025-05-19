//
//  ReceiptModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/7/25.
//

import Foundation
import SwiftData
import UIKit

@Model
class ReceiptModel: Identifiable {
    var id: UUID
    var place: String
    var date: Date
    var price: Int
    var imageData: Data

    init(place: String, date: Date, price: Int, imageData: Data) {
        self.id = UUID()
        self.place = place
        self.date = date
        self.price = price
        self.imageData = imageData
    }

    var uiImage: UIImage? {
        UIImage(data: imageData)
    }
}
