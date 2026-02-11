import SwiftUI

struct CustomTextField: View {
    @Binding var text: String

    let placeholder: String
    var icon: Image? = nil
    var backgroundColor: Color = .clear
    var strokeColor: Color? = nil
    var keyboardType: UIKeyboardType = .default
    var submitLabel: SubmitLabel = .done

    var body: some View {
        HStack(spacing: 12) {
            if let icon {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }

            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .submitLabel(submitLabel)
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
        .background(backgroundColor, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay {
            if let strokeColor {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(strokeColor, lineWidth: 3)
            }
        }
    }
}
