import SwiftUI

struct StoreListView: View {
    let stores: [StarbucksStore]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(stores) { store in
                    HStack(alignment: .top, spacing: 10) {
                        Image(store.imageName)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(store.name)
                                .font(.headline)
                            Text("도로명 주소 (역지오코딩 필요)")
                                .font(.caption)
                                .foregroundColor(.gray)

                            HStack(spacing: 6) {
                                if store.category.contains(.reserve) {
                                    TagLabel(text: "R")
                                }
                                if store.category.contains(.dt) {
                                    TagLabel(text: "D")
                                }
                            }
                        }

                        Spacer()
                        Text(store.formattedDistance)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
    }
}

struct TagLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.caption2)
            .foregroundColor(.white)
            .padding(.horizontal, 4)
            .background(Color.orange)
            .cornerRadius(4)
    }
}

