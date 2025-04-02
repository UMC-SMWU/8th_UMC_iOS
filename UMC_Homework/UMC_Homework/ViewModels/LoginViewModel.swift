import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var id = LoginModel()
    @Published var pwd = LoginModel()
}
