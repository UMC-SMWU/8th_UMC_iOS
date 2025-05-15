import Foundation

struct TokenResponse: Decodable {
    let access_token: String
    let token_type: String
    let refresh_token: String
    let expires_in: Int
    let scope: String?
}
