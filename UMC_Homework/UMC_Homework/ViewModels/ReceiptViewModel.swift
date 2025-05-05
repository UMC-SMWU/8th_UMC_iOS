import SwiftUI

class ReceiptViewModel: ObservableObject {
    @Published var receipts: [Receipt] = []
    @Published var showingImage: Data? = nil
    @Published var showImageModal = false
    @Published var showPicker = false
    @Published var sourceType: UIImagePickerController.SourceType = .photoLibrary

    func addReceipt(from image: UIImage) {
        
        let mockedStore = "스타벅스 신촌점"
        let mockedDate = Date()
        let mockedTotal = Int.random(in: 3000...10000)

        guard let data = image.jpegData(compressionQuality: 0.8) else { return }
        let receiptImage = ReceiptImage(imageData: data)
        let receipt = Receipt(storeName: mockedStore, date: mockedDate, totalAmount: mockedTotal, image: receiptImage)

        receipts.append(receipt)
    }

    var totalSpent: Int {
        receipts.reduce(0) { $0 + $1.totalAmount }
    }
}
