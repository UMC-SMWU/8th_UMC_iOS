import Foundation
import SwiftUI

class OrderCoffeeViewModel: ObservableObject {
    @Published var selectedSegment: OrderTopSegment = .allMenu
    @Published var selectedFilter: OrderBottomSegment = .drink
    @Published var coffeeItems: [OrderCoffeeModel] = []

    init() {
        loadDummyData()
    }

    private func loadDummyData() {
        coffeeItems = [
            OrderCoffeeModel(
                krName: "추천",
                enName: "Recommended",
                imageName: "order1"
            ),
            OrderCoffeeModel(
                krName: "아이스 카페 아메리카노",
                enName: "Reserve Espresso",
                imageName: "order2"
            ),
            OrderCoffeeModel(
                krName: "카페 아메리카노",
                enName: "Reserve Drip",
                imageName: "order3"
            ),
            OrderCoffeeModel(
                krName: "카푸치노",
                enName: "Dcaf Coffee",
                imageName: "order4"
            ),
            OrderCoffeeModel(
                krName: "아이스 카푸치노",
                enName: "Espresso",
                imageName: "order5"
            ),
            OrderCoffeeModel(
                krName: "카라멜 마키아또",
                enName: "Blonde Coffee",
                imageName: "order6"
            ),
            OrderCoffeeModel(
                krName: "아이스 카라멜 마키아또",
                enName: "Cold Brew",
                imageName: "order7"
            ),
            OrderCoffeeModel(
                krName: "아포가토/기타",
                enName: "Others",
                imageName: "order8"
            ),
            OrderCoffeeModel(
                krName: "럼 샷 코르타도",
                enName: "Brewed Coffee",
                imageName: "order9"
            ),
            OrderCoffeeModel(
                krName: "라벤더 카페 브레베",
                enName: "Teavana",
                imageName: "order10"
            ),
            OrderCoffeeModel(
                krName: "병음료",
                enName: "RTD",
                imageName: "order11"
            )
        ]
    }
}
