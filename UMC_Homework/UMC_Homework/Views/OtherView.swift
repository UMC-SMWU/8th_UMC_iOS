import SwiftUI

struct OtherView: View {
    @ObservedObject var viewModel = OtherViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            // 닉네임과 환영 메시지
            Text("\(viewModel.nickname)님 환영합니다")
                .font(.title)
                .padding()

            HStack(spacing: 20) {
                /// 별 히스토리 버튼
                CustomButton(title: "별 히스토리", action: {
                    print("별 히스토리")
                })
                
                /// 전자 영수증 버튼
                CustomButton(title: "전자 영수증", action: {
                    print("전자 영수증")
                })
                
                /// 나만의 메뉴 버튼
                CustomButton(title: "나만의 메뉴", action: {
                    print("나만의 메뉴")
                })
            }

            /// Pay, 고객지원 섹션
            VStack(spacing: 15) {
                CustomSectionButton(leftImage: "payLogo", text: "쿠폰 등록", action: {
                    print("스타벅스 카드 등록")
                })
                CustomSectionButton(leftImage: "supportLogo", text: "고객지원", action: {
                    print("쿠폰 등록")
                })
            }
            
            /// 로그아웃 버튼
            Button(action: {
                print("로그아웃")
            }) {
                Image(systemName: "lock.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
            .padding(.top, 50)
        }
        .padding()
    }
    
    struct CustomButton: View {
        var title: String
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .cornerRadius(8)
            }
        }
    }
    
    struct CustomSectionButton: View {
        var leftImage: String
        var text: String
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                HStack {
                    Image(systemName: leftImage)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                    Text(text)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
        }
    }
}

struct OtherView_Preview: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
