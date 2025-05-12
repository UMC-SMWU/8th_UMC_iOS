//
//  AppRootView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct AppRootView: View {
    @State private var router = NavigationRouter()
    @State private var homeviewModel = HomeViewModel()
    @State private var shopviewModel = ShopViewModel()
    @State private var orderviewModel = OrderViewModel()
    @State private var storeviewModel = StoreViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            SplashView()
                .environment(router)
                .navigationBarHidden(true)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .login:
                        LoginView()
                            .environment(router)
                            .navigationBarHidden(true)
                    case .signup:
                        SignupView()
                            .environment(router)
                            .navigationBarHidden(true)
                    case .basetab:
                        BaseTabView()
                            .environment(router)
                            .environment(homeviewModel)
                            .environment(shopviewModel)
                            .environment(orderviewModel)
                            .environment(storeviewModel)
                            .navigationBarHidden(true)
                    case .coffeedetail:
                        CoffeeDetailView()
                            .environment(router)
                            .environment(homeviewModel)
                            .navigationBarHidden(true)
                    case .receipt:
                        ReceiptView()
                            .environment(router)
                            .navigationBarHidden(true)
                            .modelContainer(for: ReceiptModel.self)
                    case .othermap:
                        OtherMapView()
                            .environment(router)
                            .environment(storeviewModel)
                            .navigationBarHidden(true)
                    }
                }
        }
        .environment(LocationManager.shared)
    }
}
