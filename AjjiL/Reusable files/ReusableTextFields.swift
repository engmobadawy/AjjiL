import SwiftUI

struct CustomTextField: View {
    @Binding var text: String

    let placeholder: String
    var icon: Image? = nil
    var backgroundColor: Color = .goodGray
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





struct SecureCustomTextField: View {
    @Binding var text: String

    let placeholder: String

    // Style
    var lockIcon: Image = Image(systemName: "lock")
    var eyeColor: Color = .secondary
    var iconColor: Color = .secondary
    var backgroundColor: Color = .goodGray
    var strokeColor: Color? = nil
    var cornerRadius: CGFloat = 12
    var height: CGFloat = 56
    var strokeWidth: CGFloat = 3

    // Behavior
    var submitLabel: SubmitLabel = .done
    var onSubmit: (() -> Void)? = nil

    @State private var isRevealed = false
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 12) {
    
                lockIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(iconColor)
                    .accessibilityHidden(true)
            

            field
                .focused($isFocused)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button {
                withAnimation(.easeInOut(duration: 0.15)) {
                    isRevealed.toggle()
                }
            } label: {
                Image(systemName: isRevealed ? "eye.fill" : "eye.slash.fill")
                    .font(.system(size: 18, weight: .semibold))
                
                    .foregroundStyle(eyeColor)
                    .contentTransition(.symbolEffect(.replace))
                    .accessibilityLabel(isRevealed ? "Hide password" : "Show password")
            }
            .buttonStyle(.plain)
            .contentShape(Rectangle())
        }
        .padding(.horizontal, 16)
        .frame(height: height)
        .background(
            backgroundColor,
            in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        )
        .overlay {
            if let strokeColor {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(strokeColor, lineWidth: strokeWidth)
            }
        }
    }

    @ViewBuilder
    private var field: some View {
        let prompt = Text(placeholder).foregroundStyle(.secondary)

        if isRevealed {
            TextField("", text: $text, prompt: prompt)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .privacySensitive()
                .submitLabel(submitLabel)
                .onSubmit { onSubmit?() }
        } else {
            SecureField("", text: $text, prompt: prompt)
                .textContentType(.password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .privacySensitive()
                .submitLabel(submitLabel)
                .onSubmit { onSubmit?() }
        }
    }
}





struct PhoneTextField: View {
    @Binding var text: String

    // Fixed (always the same)
    private let placeholder = "Phone Number"
    private let countryCode = "+966"
    private let flagImage = Image("flag")
    private let phoneIcon = Image("Call")
    private let chevronImage = Image(systemName: "chevron.down")

    // Customizable from the screen
    var backgroundColor: Color = Color(.systemGray6)
    var strokeColor: Color? = nil
    var strokeWidth: CGFloat = 2

    var keyboardType: UIKeyboardType = .phonePad
    var submitLabel: SubmitLabel = .done

    var cornerRadius: CGFloat = 12
    var height: CGFloat = 56

    var body: some View {
        HStack(spacing: 12) {
            flagImage
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 20)

            chevronImage
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)

            Text(countryCode)
                .font(.system(size: 18, weight: .medium))

            Rectangle()
                .fill(Color.secondary.opacity(0.25))
                .frame(width: 1, height: 24)

            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .submitLabel(submitLabel)
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)

            phoneIcon
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
        }
        .padding(.horizontal, 16)
        .frame(height: height)
        .background(backgroundColor, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .overlay {
            if let strokeColor {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(strokeColor, lineWidth: strokeWidth)
            }
        }
    }
}


