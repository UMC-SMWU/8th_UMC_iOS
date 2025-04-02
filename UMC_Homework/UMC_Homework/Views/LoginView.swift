import SwiftUI

struct LoginView: View {
    @ObservedObject var LoginModel: LoginModel = .init()
    var viewModel: SignupViewModel = .init()
    @State private var navigationTrue: Bool = false
        
    // @State private var isIdFocused = false
    // @State private var isPwdFocused = false
    
    var body: some View {
        VStack{
            Spacer().frame(height: 104)
            mainTitleGroup
            Spacer()
            mainCenterGroup
            Spacer()
            mainBottomGroup
        }
        .padding(.horizontal, 19) // 좌우 패딩 추가
    }
    
    /// 상단 Titile VStack
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
                TextField("아이디", text: $LoginModel.id)
                    .padding(.vertical, 8)
                    //.focused($isIdFocused)
                
                /// Divider 색상을 초록색으로 변경
                Divider()
                    //.background(isIdFocused ? Color.green : Color.gray)
            }
            Spacer().frame(height: 47)
            
            /// PWD
            VStack(alignment: .leading) {
                TextField("비밀번호", text: $LoginModel.pwd)
                    .padding(.vertical, 8)
                    //.focused($isPwdFocused)
                
                /// Divider 색상을 초록색으로 변경
                Divider()
                    //.background(isPwdFocused ? Color.green : Color.gray)
            }
            Spacer().frame(height: 47)
            
            ZStack {
                Image(.login)
                Text("로그인하기")
                    //.font()
                    .foregroundColor(.white)
            }
        }
    }
    
    /// 하단 Login VStack
    private var mainBottomGroup: some View {
        VStack(alignment: .center, spacing: 19) {
            NavigationLink(destination: SignupView()) {
                Text("이메일로 회원가입하기")
                    .underline()
                // .foregroundColor(.grey00)
            }
            
            Image(.kakaoLogin)
            Image(.appleLogin)
        }
    }
}
    
struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
    
