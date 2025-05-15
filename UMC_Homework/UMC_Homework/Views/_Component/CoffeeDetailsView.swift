import SwiftUI

struct CoffeeDetailsView: View {
    let coffee: CoffeeDetailsModel
    @Environment(\.dismiss) private var dismiss

    @State private var selectedTemp: TemperatureType? = nil
    @Namespace private var animation

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    Image(coffee.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(16)

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(coffee.nameKR)
                                .font(.title)
                                .bold()
                            Spacer()
                            Text("NEW")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        Text(coffee.nameEN)
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Divider()

                        Text(coffee.description)
                            .font(.body)
                            .padding(.top)

                        Text("₩ \(coffee.price)")
                            .font(.title3)
                            .bold()
                            .padding(.top, 10)

                        if !coffee.temperatureOptions.isEmpty {
                            HStack(spacing: 12) {
                                ForEach(coffee.temperatureOptions, id: \.self) { temp in
                                    Text(temp.rawValue)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(
                                            ZStack {
                                                if selectedTemp == temp {
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .fill(Color.green)
                                                        .matchedGeometryEffect(id: "temp", in: animation)
                                                } else {
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(Color.gray, lineWidth: 1)
                                                }
                                            }
                                        )
                                        .foregroundColor(selectedTemp == temp ? .white : .gray)
                                        .onTapGesture {
                                            withAnimation {
                                                selectedTemp = temp
                                            }
                                        }
                                }
                            }
                            .padding(.top, 8)
                        }
                    }
                    .padding()
                }
                .padding(.horizontal)
            }

            Spacer()

            OrderButtonView()
        }
        .navigationTitle(coffee.nameKR)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
        }
    }
}
