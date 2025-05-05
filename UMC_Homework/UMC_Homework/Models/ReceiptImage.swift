import Foundation
import SwiftData

class ReceiptImage {
    var id: UUID = UUID()
    var imageData: Data

    init(imageData: Data) {
        self.imageData = imageData
    }
}
