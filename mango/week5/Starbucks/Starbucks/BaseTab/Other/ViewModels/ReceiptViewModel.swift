//
//  ReceiptViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/7/25.
//

import Foundation
import SwiftUI
import Vision
import SwiftData

class ReceiptViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var showImagePicker = false
    @Published var showCameraPicker = false
    @Published var showActionSheet = false
    @Published var imageSource: UIImagePickerController.SourceType = .photoLibrary

    func extractText(from image: UIImage, context: ModelContext) {
        guard let cgImage = image.cgImage else { return }

        let request = VNRecognizeTextRequest { request, error in
            guard error == nil,
                  let observations = request.results as? [VNRecognizedTextObservation] else {
                return
            }

            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")

            print("===== OCR 결과 출력 =====")
            print(fullText)
            print("===== END =====")

            let parsed = self.parseWithoutRegex(from: fullText)

            if let data = image.jpegData(compressionQuality: 0.8) {
                let receipt = ReceiptModel(place: parsed.place, date: parsed.date, price: parsed.price, imageData: data)
                DispatchQueue.main.async {
                    context.insert(receipt)
                    try? context.save()
                }
            }
        }

        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        request.minimumTextHeight = 0.02
        request.recognitionLanguages = ["ko-KR"]

        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }

    private func parseWithoutRegex(from text: String) -> (place: String, date: Date, price: Int) {
        let lines = text.components(separatedBy: .newlines)

        var place = "장소 없음"
        var date = Date()
        var price = 0

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        let dateFormats = [
            "yyyy-MM-dd HH:mm:ss",
            "yyyy.MM.dd HH:mm",
            "yyyy/MM/dd HH:mm",
            "yyyy-MM-dd",
            "yyyy.MM.dd"
        ]

        for (i, line) in lines.enumerated() {
            let trimmed = line.trimmingCharacters(in: .whitespaces)

            if place == "장소 없음", trimmed.contains("점") {
                place = "스타벅스 " + trimmed
            }

            if price == 0, trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    price = amount
                }
            }

            if let parsedDate = dateFormats.compactMap({
                formatter.dateFormat = $0
                return formatter.date(from: trimmed)
            }).first {
                date = parsedDate
            }
        }

        return (place: place, date: date, price: price)
    }
}
