//
//  MenuSegment.swift
//  Starbucks
//
//  Created by 엄민서 on 4/11/25.
//

import Foundation

enum TopSegment: String, CaseIterable, Identifiable {
    case allmenu
    case mymenu

    var id: String { rawValue }

    var title: String {
        switch self {
        case .allmenu: return "전체 메뉴"
        case .mymenu: return "나만의 메뉴"
        }
    }
}

enum BottomSegment: String, CaseIterable, Identifiable {
    case drink
    case food
    case goods

    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .drink: return "음료"
        case .food: return "푸드"
        case .goods: return "상품"
        }
    }
}
