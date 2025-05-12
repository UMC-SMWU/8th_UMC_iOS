//
//  ContentView.swift
//  6th_Practice
//
//  Created by 엄민서 on 5/12/25.
//


import SwiftUI

struct ContentView: View {
    @State var showCameraView: Bool = false
    var body: some View {
        Button(action: {
            showCameraView.toggle()
        }, label: {
            Text("책 조회하기")
                .font(.title)
                .foregroundStyle(Color.black)
        })
        .fullScreenCover(isPresented: $showCameraView, content: {
            ISBNScannerView()
        })
    }
}

#Preview {
    ContentView()
}