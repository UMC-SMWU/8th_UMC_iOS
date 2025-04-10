//
//  ShopViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 4/6/25.
//

import SwiftUI
import Observation

@Observable
class ShopViewModel {
    
    let allItems: [AllProductsModel] = [
        AllProductsModel(image: Image("allproducts1"), name: "텀블러"),
        AllProductsModel(image: Image("allproducts2"), name: "커피 용품"),
        AllProductsModel(image: Image("allproducts3"), name: "선물세트"),
        AllProductsModel(image: Image("allproducts4"), name: "보온병"),
        AllProductsModel(image: Image("allproducts5"), name: "머그컵"),
        AllProductsModel(image: Image("allproducts6"), name: "라이프스타일")
    ]
    
    let bestItems: [BestItemsModel] = [
        BestItemsModel(image: Image("bestitems1"), name: "그린 사이렌 슬리브 머그\n355ml"),
        BestItemsModel(image: Image("bestitems2"), name: "그린 사이렌 클래식 머그\n355ml"),
        BestItemsModel(image: Image("bestitems3"), name: "사이렌 머그 앤 우드 소서"),
        BestItemsModel(image: Image("bestitems4"), name: "리저브 골드 테일 머그\n355ml"),
        BestItemsModel(image: Image("bestitems5"), name: "블랙 앤 골드 머그 473ml"),
        BestItemsModel(image: Image("bestitems6"), name: "블랙 링 머그 355ml"),
        BestItemsModel(image: Image("bestitems7"), name: "북청사자놀음 데미머그\n89ml"),
        BestItemsModel(image: Image("bestitems8"), name: "서울 제주 데미머그 세트")
    ]
    
    let newItems: [NewProductsModel] = [
        NewProductsModel(image: Image("newproducts1"), name: "그린 사이렌 도트 머\n237ml"),
        NewProductsModel(image: Image("newproducts2"), name: "그린 사이렌 도트 머\n355ml"),
        NewProductsModel(image: Image("newproducts3"), name: "홈 카페 미니 머그 세트"),
        NewProductsModel(image: Image("newproducts4"), name: "홈 카페 글라스 세트"),
    ]
}
