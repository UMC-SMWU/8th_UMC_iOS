import Foundation
import SwiftUI

class RecommendedMenuViewModel: ObservableObject {
    @Published var recommendedMenus: [RecommendedMenu] = []
    
    init() {
        loadDummyData()
    }
    
    private func loadDummyData() {
        recommendedMenus = [
            RecommendedMenu(name: "에스프레소 콘파나", imageName: "menu1"),
            RecommendedMenu(name: "에스프레소 마키아또", imageName: "menu2"),
            RecommendedMenu(name: "아이스 카페 아메리카노", imageName: "menu3"),
            RecommendedMenu(name: "카페 아메리카노", imageName: "menu4"),
            RecommendedMenu(name: "아이스 카라멜 마키아또", imageName: "menu5"),
            RecommendedMenu(name: "카라멜 마키아또", imageName: "menu6")
        ]
    }
}

struct RecommendedMenu: Identifiable {
    let id: UUID
    var name: String
    var imageName: String
    
    init(name: String, imageName: String, id: UUID = UUID()) {
        self.name = name
        self.imageName = imageName
        self.id = id
    }
}
