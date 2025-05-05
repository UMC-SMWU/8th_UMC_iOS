////
////  ReceiptView.swift
////  UMC_Homework
////
////  Created by 김지우 on 4/7/25.
////
//
//import SwiftUI
//import SwiftData
//import PhotosUI
//
//struct ReceiptView: View {
//    @Environment(\.modelContext) var context
//    @Query var receipts: [ReceiptSegment]
//    @State private var showingImagePicker = false
//    @State private var selectedImage: UIImage?
//    @State private var showActionSheet = false
//    @State private var showFullImage: UIImage?
//    
////    var totalSpent: Int {
////        receipts.reduce(0) { $0 + $1.total }
////    }
//
//    var body: some View {
//        VStack {
//            HeaderView(title: "전자 영수증") {
//                showActionSheet = true
//            }
//
//            HStack {
//                Text("총 \(receipts.count)건")
//                Spacer()
//                //Text("사용합계 \(totalSpent)원")
//            }
//            .font(.headline)
//            .padding()
//
//            List {
//                ForEach(receipts) { receipt in
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(receipt.store)
//                            Text(receipt.date.formatted(date: .abbreviated, time: .omitted))
//                                .font(.caption)
//                        }
//                        Spacer()
//                        Button {
//                            showFullImage = receipt.image?.uiImage
//                        } label: {
//                            Image(systemName: "circle")
//                                .font(.title2)
//                        }
//                    }
//                }
//                .onDelete { indexSet in
//                    for index in indexSet {
//                        context.delete(receipts[index])
//                    }
//                }
//            }
//            .listStyle(.plain)
//        }
//        .sheet(item: $showFullImage) { image in
//            ZStack(alignment: .topTrailing) {
//                Color.black.opacity(0.9).ignoresSafeArea()
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .padding()
//                Button("닫기") {
//                    showFullImage = nil
//                }
//                .padding()
//                .foregroundColor(.white)
//            }
//        }
//        .confirmationDialog("영수증 등록", isPresented: $showActionSheet, titleVisibility: .visible) {
//            Button("앨범에서 선택") {
//                showingImagePicker = true
//            }
//            Button("취소", role: .cancel) {}
//        }
//        .sheet(isPresented: $showingImagePicker) {
//            ImagePicker(image: $selectedImage)
//                .onDisappear {
//                    if let image = selectedImage {
//                        handleImagePicked(image)
//                    }
//                }
//        }
//    }
//}
