//
//  NewsCard.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct NewsCard: View {
    let news: NewsModel
        
    init(news: NewsModel) {
        self.news = news
    }
    
    var body: some View {
        VStack {
            news.image
                .resizable()
                .frame(width: 242, height: 160)
            
            Text(news.title)
                .foregroundStyle(Color.black02)
                .font(.mainTextSemiBold18)
                .frame(width: 242, alignment: .leading)
                .lineLimit(1)
                .kerning(-0.3)
                .padding(.top, 16)
            
            Text(news.subtitle.split(separator: "").joined(separator: "\u{200B}"))
                .foregroundStyle(Color.gray03)
                .font(.mainTextSemiBold13)
                .frame(width: 242)
                .kerning(-0.3)
                .padding(.top, 9)
        }
    }
}
