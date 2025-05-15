import SwiftUI

struct LoginView: View {
    @ObservedObject var loginModel: LoginModel = .init()
    @EnvironmentObject var userManager: UserManager
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
            .padding(.horizontal, UIScreen.main.bounds.width * 0.5)
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
                Text("스타벅스입니다.")
            }
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .foregroundColor(.gray)
        }
    }
    
    /// 중앙 ID & PW 입력 VStack
    private var mainCenterGroup: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                TextField("아이디", text: $loginModel.id)
                    .padding(.vertical, 8)
                    .autocapitalization(.none)
                Divider()
            }
            Spacer().frame(height: 20)
            
            VStack(alignment: .leading) {
                SecureField("비밀번호", text: $loginModel.pwd)
                    .padding(.vertical, 8)
                Divider()
            }
            Spacer().frame(height: 20)
            
            Button(action: {
                login()
            }) {
                ZStack {
                    Image(.login)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70)
                    Text("로그인하기")
                        .foregroundColor(.white)
                        .bold()
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
            Button(action: {
                initiateKakaoLogin()
            }) {
                Image(.kakaoLogin)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 44)
            }
            Image(.appleLogin)
        }
    }
    
    // 로그인 처리 함수
    private func login() {
        let id = loginModel.id
        let pw = loginModel.pwd
        
        if !id.isEmpty && !pw.isEmpty {
            // 로그인 성공 시 Keychain에 저장
            KeychainHelper.shared.save(key: "userID", value: id)
            KeychainHelper.shared.save(key: "password", value: pw)
            
            // 로그인 상태 업데이트
            userManager.login(id: id, pw: pw)
        } else {
            print("아이디 또는 비밀번호를 확인하세요.")
        }
    }
    
    // 카카오 로그인 처리 함수
    func initiateKakaoLogin() {
        let clientID = "YOUR_KAKAO_REST_API_KEY"
        let redirectURI = "yourapp://oauth" // Info.plist에도 이 URI 등록 필수!
        
        let authURL = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=\(clientID)&redirect_uri=\(redirectURI)"
        
        if let url = URL(string: authURL) {
            UIApplication.shared.open(url)
        }
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

