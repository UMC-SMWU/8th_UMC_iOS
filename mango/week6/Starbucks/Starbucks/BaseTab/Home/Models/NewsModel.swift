//
//  NewsModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI
import Foundation

struct NewsModel: Identifiable {
    let id = UUID()
    var image: Image
    var title: String
    var subtitle: String
}
