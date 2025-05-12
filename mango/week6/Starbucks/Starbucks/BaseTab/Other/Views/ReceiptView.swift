//
//  ReceiptView.swift
//  Starbucks
//
//  Created by 엄민서 on 4/7/25.
//

import SwiftUI
import SwiftData

struct ReceiptView: View {
    @StateObject private var viewModel = ReceiptViewModel()
    @Environment(\.modelContext) var context
    @Query var receipts: [ReceiptModel]
    @State private var showImage: UIImage?
    @Environment(NavigationRouter.self) private var router

    private var titleView: some View {
        HStack {
            Text("총")
                .foregroundStyle(Color.black00)
                .font(.mainTextMedium18)
            Text("\(receipts.count)건")
                .foregroundStyle(Color.brown01)
                .font(.mainTextSemiBold18)
            Spacer()
            Text("합계")
                .foregroundStyle(Color.black00)
                .font(.mainTextMedium18)
            Text("\(receipts.map { $0.price }.reduce(0, +))")
                .foregroundStyle(Color.brown01)
                .font(.mainTextSemiBold18)
        }
        .padding(.horizontal, 19)
        .padding(.bottom, 24)
    }

    var body: some View {
        VStack(spacing: 0) {
            CustomNavBar(
                viewTitle: "전자영수증",
                showBackButton: true,
                showPlusButton: true,
                backAction: {
                    router.pop()
                },
                plusAction: {
                    viewModel.showActionSheet = true
                }
            )

            if receipts.isEmpty {
                ContentUnavailableView("등록된 영수증이 없습니다", systemImage: "doc.plaintext")
                    .frame(maxHeight: .infinity)
            } else {
                titleView

                List {
                    ForEach(receipts) { receipt in
                        ReceiptDataCard(receipt: receipt, showImage: $showImage)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach {
                            context.delete(receipts[$0])
                        }
                        try? context.save()
                    }
                }
                .listStyle(.plain)
                .padding(.horizontal, 19)
            }
        }
        .background(Color.white00)
        .confirmationDialog(
            Text("영수증을 어떻게 추가할까요?"),
            isPresented: $viewModel.showActionSheet,
            titleVisibility: .visible
        ) {
            Button("앨범에서 가져오기") {
                viewModel.imageSource = .photoLibrary
                viewModel.showImagePicker = true
            }
            Button("카메라로 촬영하기") {
                viewModel.imageSource = .camera
                viewModel.showCameraPicker = true
            }
            Button("취소", role: .cancel) {}
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(sourceType: viewModel.imageSource) { image in
                if let image = image {
                    viewModel.extractText(from: image, context: context)
                }
            }
        }
        .overlay {
            if let image = showImage {
                ReceiptImagePopup(image: image) {
                    showImage = nil
                }
            }
        }
    }
}
