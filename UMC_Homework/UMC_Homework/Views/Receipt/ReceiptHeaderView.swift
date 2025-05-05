import SwiftUI

struct ReceiptHeaderView: View {
    let onDismiss: () -> Void
    let onAdd: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onDismiss) {
                Image(systemName: "chevron.left")
            }
            Spacer()
            Text("전자 영수증")
                .font(.headline)
            Spacer()
            Button(action: onAdd) {
                Image(systemName: "plus")
            }
        }
        .padding()
    }
}
