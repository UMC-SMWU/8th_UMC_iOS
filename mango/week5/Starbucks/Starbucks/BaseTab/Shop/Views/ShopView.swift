//
//  ShopView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct ShopView: View {
    @Environment(ShopViewModel.self) var shopviewModel
    @State private var currentPage = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 31) {
                shopBannerView
                allProductsView
                bestItemsView
                newProductsView
            }
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.white01)
    }
    
    private var shopBannerView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Starbucks Online Store")
                .foregroundStyle(Color.black00)
                .font(.mainTextBold24)
                .kerning(-0.5)
                .padding(.top, 67)
                .padding(.leading, 16)
            
            ScrollView(.horizontal, content: {
                LazyHStack(spacing: 28) {
                    Image("shopbanner1")
                    Image("shopbanner2")
                    Image("shopbanner3")
                }
                .padding(.horizontal, 16)
            })
            .scrollIndicators(.hidden)
        }
    }
    
    private var allProductsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Products")
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold22)
                .kerning(-0.5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 17) {
                    ForEach(shopviewModel.allItems) { item in
                        VStack(spacing: 10) {
                            item.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Text(item.name)
                                .foregroundStyle(Color.black02)
                                .font(.mainTextSemiBold13)
                        }
                    }
                }
            }
        }
        .padding(.leading, 16)
    }
    
    private var bestItemsView: some View {
        let items = shopviewModel.bestItems
        let itemsPerPage = 4
        let pageCount = Int(ceil(Double(items.count) / Double(itemsPerPage)))
        let columns = [
            GridItem(.flexible(), spacing: 65),
            GridItem(.flexible(), spacing: 0)
        ]
        return VStack(alignment: .leading, spacing: 16) {
            Text("Best Items")
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold22)
                .kerning(-0.5)
                .padding(.leading, 16)
            
            TabView(selection: $currentPage) {
                ForEach(0..<pageCount, id: \.self) { pageIndex in
                    let start = pageIndex * itemsPerPage
                    let end = min(start + itemsPerPage, items.count)
                    let pageItems = Array(items[start..<end])
                    
                    LazyVGrid(columns: columns, spacing: 54) {
                        ForEach(pageItems) { item in
                            VStack(spacing: 12) {
                                item.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 157, height: 156)
                                
                                Text(item.name)
                                    .foregroundStyle(Color.black02)
                                    .font(.mainTextSemiBold14)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                    .tag(pageIndex)
                    .padding(.horizontal, 30)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 470)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            PageControl(numberOfPages: pageCount, currentPage: $currentPage)
                .frame(maxWidth: .infinity)
        }
    }
        
    private var newProductsView: some View {
        let columns = [
            GridItem(.flexible(), spacing: 65),
            GridItem(.flexible(), spacing: 0)
        ]
        return VStack(alignment: .leading, spacing: 16) {
            Text("New Products")
                .foregroundStyle(Color.black03)
                .font(.mainTextSemiBold22)
                .kerning(-0.5)
                .padding(.leading, 16)
            
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(shopviewModel.newItems) { item in
                    VStack(spacing: 12) {
                        item.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 157, height: 156)
                        
                        Text(item.name)
                            .foregroundStyle(Color.black02)
                            .font(.mainTextSemiBold14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}
