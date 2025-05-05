import SwiftUI

struct OrderCoffeeView: View {
    let item: OrderCoffeeModel

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .background(Circle().fill(Color.gray.opacity(0.1)))
                .foregroundColor(.brown)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.krName)
                    .font(.mainTextMedium16)
                    .foregroundColor(.black)
                Text(item.enName)
                    .font(.mainTextRegular12)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.horizontal, 29)
    }
}

