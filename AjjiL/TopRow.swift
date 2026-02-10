import SwiftUI

struct TopRow: View {
    var onArabicTapped: () -> Void = {}
    var onSkipTapped: () -> Void = {}

    private let barHeight: CGFloat = 26

    var body: some View {
        HStack(spacing: 0) {
            Button(action: onArabicTapped) {
                Text("عربي")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(y:-1)
            }

            Image("navigationLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 28)
                .accessibilityLabel("AjjiL")
                .frame(maxWidth: .infinity)

            Button(action: onSkipTapped) {
                Text("Skip")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(y:-1)
            }
        }
        .frame(height: barHeight)
        .padding(.horizontal, 18)
        .foregroundStyle(.black)
        .contentShape(Rectangle())
    }
}
