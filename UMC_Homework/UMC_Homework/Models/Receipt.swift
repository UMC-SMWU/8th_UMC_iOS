import Foundation
import SwiftData

class Receipt {
    var id: UUID = UUID()
    var storeName: String
    var date: Date
    var totalAmount: Int
    @Relationship var image: ReceiptImage?

    init(storeName: String, date: Date, totalAmount: Int, image: ReceiptImage? = nil) {
        self.storeName = storeName
        self.date = date
        self.totalAmount = totalAmount
        self.image = image
    }
}
