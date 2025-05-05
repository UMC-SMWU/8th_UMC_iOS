import Foundation
import SwiftUI

struct StoreSheetView: View {
    @ObservedObject var locationManager = LocationManager()
    @StateObject var viewModel = StoreViewModel()
    @State private var isMapMode = false
    @State private var selectedTab = "가까운 매장"
    
    var body: some View {
        VStack(spacing: 0) {
            
            Capsule().frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.3))
                .padding(.top, 8)
            
            HStack {
                Text("매장 설정")
                    .font(.headline)
                Spacer()
                Button {
                    isMapMode.toggle()
                } label: {
                    Image(systemName: isMapMode ? "list.bullet" : "map")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            TextField("검색", text: .constant(""))
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)

            HStack {
                Button("가까운 매장") {
                    selectedTab = "가까운 매장"
                }
                .fontWeight(selectedTab == "가까운 매장" ? .bold : .regular)
                .foregroundColor(selectedTab == "가까운 매장" ? .black : .gray)

                Spacer()

                Button("자주 가는 매장") {
                    selectedTab = "자주 가는 매장"
                }
                .fontWeight(selectedTab == "자주 가는 매장" ? .bold : .regular)
                .foregroundColor(selectedTab == "자주 가는 매장" ? .black : .gray)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            Divider()

            if isMapMode {
                StoreMapView(stores: viewModel.nearbyStores,
                             userLocation: locationManager.currentLocation)
            } else {
                StoreListView(stores: viewModel.nearbyStores)
            }
        }
        .onAppear {
            viewModel.loadStores(userLocation: locationManager.currentLocation)
        }
    }
}

