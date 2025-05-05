import SwiftUI

struct LoginView: View {
    @ObservedObject var loginModel: LoginModel = .init()
    @State private var navigationTrue: Bool = false
        
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 104)
                mainTitleGroup
                Spacer()
                mainCenterGroup
                Spacer()
                mainBottomGroup
            }
            .padding(.horizontal, 19) 
        }
    }
    
    /// 상단 Title VStack
    private var mainTitleGroup: some View {
        VStack(alignment: .leading) {
            Image(.starbucksLogo)
                .resizable()
                .frame(width: 97, height: 95)
            Spacer().frame(height: 28)
            
            VStack(alignment: .leading) {
                Text("안녕하세요.")
                    //.font(.mainTextExtraBold24)
                Text("스타벅스입니다.")
                    //.font(.mainTextExtraBold24)
            }
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                //.font(.mainTextRegular13)
                .foregroundColor(.gray)
        }
    }
    
    /// 중앙 ID & PW 입력 VStack
    private var mainCenterGroup: some View {
        VStack(alignment: .leading) {
            /// ID
            VStack(alignment: .leading) {
                TextField("아이디", text: $loginModel.id)
                    .padding(.vertical, 8)
                    .autocapitalization(.none)
                
                /// Divider 색상을 초록색으로 변경
                Divider()
            }
            Spacer().frame(height: 47)
            
            /// PWD
            VStack(alignment: .leading) {
                SecureField("비밀번호", text: $loginModel.pwd)
                    .padding(.vertical, 8)
                
                /// Divider 색상을 초록색으로 변경
                Divider()
            }
            Spacer().frame(height: 47)
            
            Button(action: {
                login()
            }) {
                ZStack {
                    Image(.login)
                    Text("로그인하기")
                        .foregroundColor(.white)
                }
            }
            .disabled(loginModel.id.isEmpty || loginModel.pwd.isEmpty)
        }
    }
    
    /// 하단 Login VStack
    private var mainBottomGroup: some View {
        VStack(alignment: .center, spacing: 19) {
            NavigationLink(destination: SignupView()) {
                Text("이메일로 회원가입하기")
                    .underline()
            }
            
            Image(.kakaoLogin)
            Image(.appleLogin)
        }
    }
    
    // 로그인 처리 함수 (Example)
    private func login() {
        // Implement your login logic here.
        // For example, check if the id and pwd are correct.
        
        if !loginModel.id.isEmpty && !loginModel.pwd.isEmpty {
            // Simulate a successful login
            print("Login successful!")
            // Navigate to next screen or perform any other actions
        } else {
            print("Please enter valid credentials.")
        }
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

