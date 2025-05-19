//
//  HomeViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI
import Foundation
import Observation

@Observable
class HomeViewModel {
    var selectedCoffeeModel: CoffeeDetailModel? = nil

    let dummyCoffees: [CoffeeDetailModel] = [
        CoffeeDetailModel(image: Image("coffee1"), squareImage: Image("coffee1_sq"), name: "에스프레소 콘파나", enName: "Espresso Con Panna",
                    content: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
                    price: "4,100", bothTemps: false, temp: .hot),
        CoffeeDetailModel(image: Image("coffee2"), squareImage: Image("coffee2_sq"), name: "에스프레소 마키아또", enName: "Espresso Con Panna",
                    content: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
                    price: "3,900", bothTemps: false, temp: .iced),
        CoffeeDetailModel(image: Image("coffee3"), squareImage: Image("coffee3_sq"), name: "아이스 카페 아메리카노", enName: "Iced Caffe Americano",
                    content: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
                    price: "4,700", bothTemps: true, temp: .iced ),
        CoffeeDetailModel(image: Image("coffee4"), squareImage: Image("coffee4_sq"), name: "카페 아메리카노", enName: "Caffe Americano",
                    content: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피",
                    price: "4,700", bothTemps: true, temp: .hot),
        CoffeeDetailModel(image: Image("coffee5"), squareImage: Image("coffee5_sq"), name: "아이스 카라멜 마키아또", enName: "Iced Caramel Macchiato",
                    content: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "6,100", bothTemps: true, temp: .iced),
        CoffeeDetailModel(image: Image("coffee6"), squareImage: Image("coffee6_sq"), name: "카라멜 마키아또", enName: "Caramel Macchiato",
                    content: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                    price: "6,100", bothTemps: true, temp: .hot)
        
    ]
    
    let dummyNews: [NewsModel] = [
        NewsModel(image: Image("news1"), title: "25년 3월 일회용컵 없는 날 캠페인 개최", subtitle: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."),
        NewsModel(image: Image("news2"), title: "스타벅스 OOO점을 찾습니다", subtitle: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다."),
        NewsModel(image: Image("news3"), title: "2월 8일, 리저브 스프링 신규 커피 출시", subtitle: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.")
    ]
    
    let dummyBreads: [BreadDetailModel] = [
        BreadDetailModel(image: Image("bread1"), name: "너티 크루아상"),
        BreadDetailModel(image: Image("bread2"), name: "매콤 소시지 불고기"),
        BreadDetailModel(image: Image("bread3"), name: "미니 리프 파이"),
        BreadDetailModel(image: Image("bread4"), name: "뺑 오 쇼콜라"),
        BreadDetailModel(image: Image("bread5"), name: "소시지&올리브 파이"),
    ]
}
