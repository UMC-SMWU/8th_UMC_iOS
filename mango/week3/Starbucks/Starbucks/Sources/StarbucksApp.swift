//import SwiftUI
//
//@main
//struct StarbucksApp: App {
//    @State var router = NavigationRouter()
//    @State var viewModel = HomeViewModel()
//
//    var body: some Scene {
//        WindowGroup {
//            MainHomeView()
//                .environment(router)
//                .environment(viewModel)
//        }
//    }
//}

import SwiftUI

@main
struct StarbucksApp: App {
    var body: some Scene {
        WindowGroup {
            AppRootView()
        }
    }
}
