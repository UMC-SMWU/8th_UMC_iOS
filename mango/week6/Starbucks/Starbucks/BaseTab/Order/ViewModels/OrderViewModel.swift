//
//  OrderViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/11/25.
//

import SwiftUI
import Observation

@Observable
class OrderViewModel {
    var selectedTop: TopSegment = .allmenu
    var selectedBottom: BottomSegment = .drink

    let allDrinkItems: [MenuDetailModel] = [
        MenuDetailModel(image: Image("drink1"), name: "추천", enName: "Recommended", showDot: true),
        MenuDetailModel(image: Image("drink2"), name: "아이스 카페 아메리카노", enName: "Iced Caffe Americano", showDot: true),
        MenuDetailModel(image: Image("drink3"), name: "카페 아메리카노", enName: "Caffe Americano", showDot: true),
        MenuDetailModel(image: Image("drink4"), name: "카푸치노", enName: "Cappuccino", showDot: false),
        MenuDetailModel(image: Image("drink5"), name: "아이스 카푸치노", enName: "Iced Cappuccino", showDot: true),
        MenuDetailModel(image: Image("drink6"), name: "카라멜 마키아또", enName: "Caramel Macchiato", showDot: true),
        MenuDetailModel(image: Image("drink7"), name: "아이스 카라멜 마키아또", enName: "Iced Caramel Macchiato", showDot: true),
        MenuDetailModel(image: Image("drink8"), name: "아포가토", enName: "Affogato", showDot: false),
        MenuDetailModel(image: Image("drink9"), name: "코르타도", enName: "Cortado", showDot: true),
        MenuDetailModel(image: Image("drink10"), name: "라벤더 카페 브레베", enName: "Lavender Cafe Breve", showDot: true),
        MenuDetailModel(image: Image("drink11"), name: "병음료", enName: "RTD", showDot: false)
    ]
    
    let allFoodItems: [MenuDetailModel] = [
        MenuDetailModel(image: Image("drink1"), name: "추천", enName: "Recommended", showDot: false)
    ]
    let allGoodsItem: [MenuDetailModel] = [
        MenuDetailModel(image: Image("drink1"), name: "추천", enName: "Recommended", showDot: false)
    ]
    
    var filteredItems: [MenuDetailModel] {
        guard selectedTop == .allmenu else { return [] }
        
        switch selectedBottom {
        case .drink: return allDrinkItems
        case .food: return allFoodItems
        case .goods: return allGoodsItem
        }
    }
}
