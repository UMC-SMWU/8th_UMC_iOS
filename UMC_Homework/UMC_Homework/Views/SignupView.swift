import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel = SignupViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack (alignment: .leading){
                TextField("닉네임", text: $viewModel.nickname)
                    .padding()
                Divider()
                Spacer().frame(height: 49)
                
                TextField("이메일", text: $viewModel.email)
                    .padding()
                Divider()
                Spacer().frame(height: 49)
                
                SecureField("비밀번호", text: $viewModel.pwd)
                    .padding()
                Divider()
            }
            Spacer().frame(height: 428)
            
            Button(action: {
                if !viewModel.nickname.isEmpty && !viewModel.email.isEmpty && !viewModel.pwd.isEmpty {
                    viewModel.saveSignupData()
                    dismiss() // 네비게이션 POP
                }
            }) {
                ZStack {
                    Image(.login)
                    Text("생성하기")
                        //.font()
                        .foregroundColor(.white)
                }
            }
            .disabled(viewModel.nickname.isEmpty || viewModel.email.isEmpty || viewModel.pwd.isEmpty)
        }
        .padding()
        .navigationTitle("가입하기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevronleft")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    SignupView()
}
