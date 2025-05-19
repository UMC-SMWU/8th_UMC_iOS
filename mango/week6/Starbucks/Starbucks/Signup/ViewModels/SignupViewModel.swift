//
//  SignupViewModel.swift
//  Starbucks
//
//  Created by 엄민서 on 3/31/25.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupModel(nickname: "", email: "", password: "")
    
    func signUp() async -> Bool {
        guard let url = URL(string: "http://localhost:8080/signup") else {
            return saveLocally()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoded = try JSONEncoder().encode(signupModel)
            request.httpBody = encoded
            
            let (_, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                KeychainManager.saveSignupModel(signupModel)
                return true
            } else {
                return saveLocally()
            }
            
        } catch {
            return saveLocally()
        }
    }
    
    private func saveLocally() -> Bool {
        KeychainManager.saveSignupModel(signupModel)
        return true
    }
}
