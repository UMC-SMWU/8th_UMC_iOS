import SwiftUI

struct ReceiptListView: View {
    @StateObject private var viewModel = ReceiptViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            ReceiptHeaderView(onDismiss: { dismiss() }, onAdd: {
                viewModel.showPicker = true
            })

            HStack {
                Text("총 \(viewModel.receipts.count)건")
                Spacer()
                Text("사용합계 \(viewModel.totalSpent)원")
            }
            .padding()

            List {
                ForEach(viewModel.receipts, id: \ .id) { receipt in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(receipt.storeName)
                                .font(.headline)
                            Text(receipt.date, style: .date)
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(receipt.totalAmount)원")
                        Button(action: {
                            if let data = receipt.image?.imageData {
                                viewModel.showingImage = data
                                viewModel.showImageModal = true
                            }
                        }) {
                            Image(systemName: "dollarsign.circle")
                        }
                    }
                }
                .onDelete { indexSet in
                    viewModel.receipts.remove(atOffsets: indexSet)
                }
            }
        }
        .sheet(isPresented: $viewModel.showPicker) {
            ImagePicker(sourceType: viewModel.sourceType) { image in
                if let image = image {
                    viewModel.addReceipt(from: image)
                }
            }
        }
        .sheet(isPresented: $viewModel.showImageModal) {
            if let data = viewModel.showingImage, let uiImage = UIImage(data: data) {
                VStack {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Button("닫기") {
                        viewModel.showImageModal = false
                    }
                    .padding()
                }
            }
        }
    }
}
