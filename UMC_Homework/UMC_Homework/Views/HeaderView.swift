//
//  HeaderView.swift
//  UMC_Homework
//
//  Created by 김지우 on 4/7/25.
//
import SwiftUI

struct HeaderView: View {
    var title: String
    var onPlusTapped: () -> Void

    var body: some View {
        HStack {
            Button(action: {
                // NavigationStack에서 자동으로 뒤로감
            }) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text(title)
                .font(.headline)
            Spacer()
            Button(action: onPlusTapped) {
                Image(systemName: "plus")
            }
        }
        .padding()
    }
}
