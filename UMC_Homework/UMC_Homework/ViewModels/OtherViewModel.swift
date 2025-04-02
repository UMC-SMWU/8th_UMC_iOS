import SwiftUI

class OtherViewModel: ObservableObject {
    @AppStorage("userNickname") private var storedNickname: String = ""
    
    var nickname: String {
        return storedNickname.isEmpty ? "작성한 닉네임" : storedNickname
    }
}
