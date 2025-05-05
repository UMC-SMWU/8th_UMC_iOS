import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var pwd: String = ""
    
    // Store user data using @AppStorage for persistence
    @AppStorage("userNickname") private var storedNickname: String = ""
    @AppStorage("userEmail") private var storedEmail: String = ""
    @AppStorage("userPassword") private var storedPassword: String = ""
    
    // Function to save the signup data to AppStorage
    func saveSignupData() {
        storedNickname = nickname
        storedEmail = email
        storedPassword = pwd
    }
}

