//
//  StandardInput.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 09/02/2026.
//

import SwiftUI
struct StandardInput: View {
    @Binding var text: String
    let icon: String
    let placeholder: String
    let brandColor: Color

    let field: SignUpScreen.Field
    @FocusState.Binding var focusedField: SignUpScreen.Field?

    private var isFocused: Bool { focusedField == field }

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundStyle(.gray)
                .font(.system(size: 18))
                .frame(width: 24)

            TextField(placeholder, text: $text)
                .font(.system(size: 16))
                .textInputAutocapitalization(.never)
                .focused($focusedField, equals: field) // Ensure internal focus
        }
        .padding()
        .frame(height: 56)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(isFocused ? brandColor : .clear, lineWidth: 1.5)
        }
        .animation(.easeInOut(duration: 0.15), value: isFocused)
    }
}

struct PhoneInput: View {
    @Binding var text: String
    let brandColor: Color

    let field: SignUpScreen.Field
    @FocusState.Binding var focusedField: SignUpScreen.Field?

    private var isFocused: Bool { focusedField == field }

    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 4) {
                Text("🇸🇦")
                    .font(.system(size: 20))

                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundStyle(.gray)

                Text("+966")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.primary)
            }

            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 1, height: 24)

            TextField("Phone Number", text: $text)
                .keyboardType(.numberPad)
                .focused($focusedField, equals: field) // Ensure internal focus
                .textContentType(.telephoneNumber)

            Image(systemName: "phone.fill")
                .foregroundStyle(.gray.opacity(0.8))
        }
        .padding()
        .frame(height: 56)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(isFocused ? brandColor : .clear, lineWidth: 1.5)
        }
        .animation(.easeInOut(duration: 0.15), value: isFocused)
    }
}

/// Corrected Password Input
struct PasswordInput: View {
    @Binding var text: String
    @Binding var isVisible: Bool
    let placeholder: String
    let brandColor: Color

    let field: SignUpScreen.Field
    // Bind directly to the focus state
    @FocusState.Binding var focusedField: SignUpScreen.Field?

    private var isFocused: Bool { focusedField == field }

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "lock.fill")
                .foregroundStyle(.gray)
                .font(.system(size: 18))
                .frame(width: 24)

            // FIX: Replaced ZStack with if-else group
            // This prevents the rendering glitch where the SecureField is active but invisible
            Group {
                if isVisible {
                    TextField(placeholder, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($focusedField, equals: field) // Internal focus
                } else {
                    SecureField(placeholder, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($focusedField, equals: field) // Internal focus
                }
            }
            // Disable animation for the field swap itself to prevent jumping
            .animation(nil, value: isVisible)

            Button {
                isVisible.toggle()
            } label: {
                Image(systemName: isVisible ? "eye.fill" : "eye.slash.fill")
                    .foregroundStyle(.gray)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .frame(height: 56)
        .background( Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(isFocused ? brandColor : .clear, lineWidth: 1.5)
        }
        .animation(.easeInOut(duration: 0.15), value: isFocused)
    }
}
