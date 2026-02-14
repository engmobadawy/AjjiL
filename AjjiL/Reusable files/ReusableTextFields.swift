import SwiftUI


struct CustomTextField: View {
    @Binding var text: String

    let placeholder: String
    var icon: Image? = nil
    var backgroundColor: Color = .goodGray
    var strokeColor: Color? = nil

    var preset: TextInputPreset = .username
    var submitLabel: SubmitLabel = .done
    var onSubmit: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 12) {
            if let icon {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }

            TextField(placeholder, text: $text)
                .textInputPreset(preset)
                .submitLabel(submitLabel)
                .onSubmit { onSubmit?() }
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
    var placeholder: String
    
    // Appearance
    var backgroundColor: Color = .goodGray
    var strokeColor: Color? = nil
    
    // Behavior
    var preset: TextInputPreset = .password
    var submitLabel: SubmitLabel = .done
    var onSubmit: (() -> Void)? = nil

    @State private var isRevealed = false
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.secondary)

            Group {
                if isRevealed {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
            }
            .textInputPreset(preset)
            .focused($isFocused)
            .submitLabel(submitLabel)
            .onSubmit { onSubmit?() }

            Button {
                isRevealed.toggle()
                isFocused = true           
            } label: {
                Image(systemName: isRevealed ? "eye" : "eye.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
        .background(backgroundColor, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay {
            if let strokeColor {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .strokeBorder(strokeColor, lineWidth: 3)
            }
        }
    }
}







import SwiftUI

struct PhoneTextField: View {
    @Binding var text: String

    // Content
    var placeholder: String = "Phone Number"
    var countryCode: String = "+966"

    // Images (SwiftUI)
    var flagImage: Image = Image("flag")
    var phoneIcon: Image = Image("Call")
    var chevronImage: Image = Image(systemName: "chevron.down")

    // Style
    var backgroundColor: Color = Color(.systemGray6)
    var strokeColor: Color? = nil
    var strokeWidth: CGFloat = 2
    var cornerRadius: CGFloat = 12
    var height: CGFloat = 56

    var iconTint: Color = .secondary
    var separatorColor: Color = .secondary.opacity(0.25)

    // Behavior (SwiftUI-friendly)
    var preset: TextInputPreset = .phone
    var submitLabel: SubmitLabel = .next
    var onSubmit: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 12) {
            flagImage
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 20)
                .accessibilityHidden(true)

            chevronImage
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundStyle(iconTint)
                .accessibilityHidden(true)

            Text(countryCode)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.primary)

            Rectangle()
                .fill(separatorColor)
                .frame(width: 1, height: 24)
                .accessibilityHidden(true)

            TextField(placeholder, text: $text)
                .textInputPreset(preset)
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .onSubmit { onSubmit?() }

            phoneIcon
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundStyle(iconTint)
                .accessibilityHidden(true)
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
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(placeholder))
        .accessibilityValue(Text("\(countryCode) \(text)"))
    }
}

