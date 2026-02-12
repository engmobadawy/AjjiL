import SwiftUI

struct TopRowWithBack: View {
    var onBack: () -> Void = {}

    var body: some View {
        HStack {
            // Left
            Button(action: onBack) {
                Image("left")
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
            }
            .buttonStyle(ScaleButtonStyle())
            .frame(maxWidth: .infinity, alignment: .leading)

            // Center
            Image("navigationLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 28)

        
            Color.clear
                .frame(width: 24, height: 24)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(height: 70)
        .padding(.horizontal, 18)
        .foregroundStyle(.black)
       
    }
}

// Custom button style for smooth tap feedback
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.60 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: configuration.isPressed)
    }
}


#Preview {
    TopRowWithBack()
}
