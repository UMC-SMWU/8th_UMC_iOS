import Foundation

class CoffeeDetailsViewModel: ObservableObject {
    @Published var coffees: [CoffeeDetailsModel] = []

    init() {
        loadDummyData()
    }

    private func loadDummyData() {
        coffees = [
            CoffeeDetailsModel(
                nameKR: "아이스 카페 아메리카노",
                nameEN: "Americano",
                description: "진한 에스프레소에 뜨거운 물을 더해 깔끔하게 즐기는 커피입니다.",
                price: "4100",
                imageName: "detailamericanoHot",
                temperatureOptions: [.hot, .iced]
            ),
            CoffeeDetailsModel(
                nameKR: "카페 라떼",
                nameEN: "Cafe Latte",
                description: "부드러운 스팀 밀크와 에스프레소가 어우러져 고소한 맛을 느낄 수 있는 커피입니다.",
                price: "4600",
                imageName: "detailamericanpCold",
                temperatureOptions: [.hot, .iced]
            ),
            CoffeeDetailsModel(
                nameKR: "카푸치노",
                nameEN: "Cappuccino",
                description: "풍성한 우유 거품과 에스프레소의 진한 맛이 어우러진 커피입니다.",
                price: "4500",
                imageName: "detailcaramelHot",
                temperatureOptions: [.hot, .iced]
            ),
            CoffeeDetailsModel(
                nameKR: "카푸치노",
                nameEN: "Cappuccino",
                description: "풍성한 우유 거품과 에스프레소의 진한 맛이 어우러진 커피입니다.",
                price: "4500",
                imageName: "detailcaramerlCold",
                temperatureOptions: [.hot, .iced]
            ),
            CoffeeDetailsModel(
                nameKR: "카푸치노",
                nameEN: "Cappuccino",
                description: "풍성한 우유 거품과 에스프레소의 진한 맛이 어우러진 커피입니다.",
                price: "4500",
                imageName: "detailconfana",
                temperatureOptions: [.hot, .iced]
            )
        ]
    }
}

