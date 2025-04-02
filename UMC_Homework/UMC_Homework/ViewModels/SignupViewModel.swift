import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var pwd: String = ""
    
    @AppStorage("userNickname") private var storedNickname: String = ""
    @AppStorage("userEmail") private var storedEmail: String = ""
    @AppStorage("userPassword") private var storedPassword: String = ""
    
    func saveSignupData() {
        storedNickname = nickname
        storedEmail = email
        storedPassword = pwd
    }
}
