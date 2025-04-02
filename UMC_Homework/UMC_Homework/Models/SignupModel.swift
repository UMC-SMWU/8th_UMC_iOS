import Foundation

class SignupModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var pwd: String = ""
}

