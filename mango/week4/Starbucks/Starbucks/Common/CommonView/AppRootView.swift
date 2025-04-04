//
//  AppRootView.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import SwiftUI

struct AppRootView: View {
    @State private var router = NavigationRouter()
    @State private var viewModel = HomeViewModel()
    
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
                            .environment(viewModel)
                            .navigationBarHidden(true)
                    case .coffeedetail:
                        CoffeeDetailView()
                            .environment(router)
                            .environment(viewModel)
                            .navigationBarHidden(true)
                    }
                }
        }
    }
}
