//
//  WhatsNewModel.swift
//  UMC_Homework
//
//  Created by 김지우 on 4/14/25.
//

import Foundation

class WhatsNewViewModel: ObservableObject {
    @Published var items: [WhatsNewModel] = [
        .init(title: "", subtitle: "", imageName: "whatsNew1"),
        .init(title: "", subtitle: "", imageName: "whatsNew2"),
        .init(title: "", subtitle: "", imageName: "whatsNew3")
    ]
}



