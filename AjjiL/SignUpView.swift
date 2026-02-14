//
//  SignUpView.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 10/02/2026.
//

import SwiftUI

struct SignUpView: View {
    // MARK: - State
    @State private var username = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isAgreed = false

    // MARK: - Focus Management
    enum Field: Hashable {
        case username, phone, email, password, confirmPassword
    }

    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Assuming TopRow exists in your project
                TopRow()
                    .background(Image("background")) // Ensure this image exists in Assets

                ScrollView {
                    VStack(spacing: 18) {
                        headerSection

                        // MARK: - Username
                        CustomTextField(
                            text: $username,
                            placeholder: "Username",
                            icon: Image(systemName: "person.fill"),
                            backgroundColor: .goodGray,
                            preset: .username,
                            submitLabel: .next,
                            onSubmit: { focusedField = .phone }
                        )
                        .focused($focusedField, equals: .username)

                        // MARK: - Phone
                        PhoneTextField(
                            text: $phone,
                            backgroundColor: .goodGray,
                            preset: .phone,
                            submitLabel: .next,
                            onSubmit: { focusedField = .email }
                        )
                        .focused($focusedField, equals: .phone)

                        // MARK: - Email
                        CustomTextField(
                            text: $email,
                            placeholder: "example@appssquare.com",
                            icon: Image(systemName: "envelope.fill"),
                            backgroundColor: .goodGray,
                            preset: .email,
                            submitLabel: .next,
                            onSubmit: { focusedField = .password }
                        )
                        .focused($focusedField, equals: .email)

                        // MARK: - Password
                        SecureCustomTextField(
                            text: $password,
                            placeholder: "Password",
                            backgroundColor: .goodGray,
                            preset: .newPassword,
                            submitLabel: .next,
                            onSubmit: { focusedField = .confirmPassword }
                        )
                        .focused($focusedField, equals: .password)

                        // MARK: - Confirm Password
                        SecureCustomTextField(
                            text: $confirmPassword,
                            placeholder: "Confirm Password",
                            backgroundColor: .goodGray,
                            preset: .newPassword,
                            submitLabel: .done,
                            onSubmit: {
                                focusedField = nil
                                handleSignUp()
                            }
                        )
                        .focused($focusedField, equals: .confirmPassword)

                        // MARK: - Actions
                        Button(action: {
                            focusedField = nil
                            handleSignUp()
                        }) {
                            Text("SIGN UP")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(isFormValid ? Color.green : Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 12))
                        }
                        .disabled(!isFormValid)
                        .padding(.top, 8)

                        TermsAgreementView(
                            isAgreed: $isAgreed,
                            onLoginTapped: {
                                // Navigate to Login
                            },
                            onAgreementTapped: {
                                // Open Terms Webview
                            }
                        )

                        // Assuming WhiteButton exists in your project
                        WhiteButton(title: "SIGN IN", action: {})
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 18)
                    .padding(.bottom, 40)
                }
                .scrollIndicators(.hidden)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color.white)
                        .ignoresSafeArea(edges: .bottom)
                )
            }
            .onTapGesture {
                focusedField = nil
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            // Slight delay ensures the view is fully transitioned before keyboard pops up
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                focusedField = .username
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") { focusedField = nil }
                
                // Smart "Next" Button
                Button("Next") {
                    if let next = nextField {
                        focusedField = next
                    }
                }
                .disabled(nextField == nil)
            }
        }
    }

    // MARK: - Computed Properties
    
    // Logic to determine the next field
    private var nextField: Field? {
        switch focusedField {
        case .username: return .phone
        case .phone: return .email
        case .email: return .password
        case .password: return .confirmPassword
        case .confirmPassword, nil: return nil
        }
    }

    private var isFormValid: Bool {
        !username.isEmpty &&
        !email.isEmpty &&
        !phone.isEmpty &&
        !password.isEmpty &&
        !confirmPassword.isEmpty &&
        password == confirmPassword &&
        isAgreed
    }

    private func handleSignUp() {
        guard isFormValid else { return }
        print("Sign up triggered")
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Create Your Account")
                .font(.title.bold())
            
            Text("Type your data to access all services")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Terms View
struct TermsAgreementView: View {
    @Binding var isAgreed: Bool

    let onLoginTapped: () -> Void
    let onAgreementTapped: () -> Void

    var body: some View {
        VStack(spacing: 28) {
            HStack(alignment: .top, spacing: 12) {
                toggleButton
                agreementText
            }

            Button(action: onLoginTapped) {
                Text("Already Have An Account?")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color.gray)
            }
        }
    }

    private var toggleButton: some View {
        Button {
            withAnimation(.snappy) {
                isAgreed.toggle()
                if isAgreed { onAgreementTapped() }
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(isAgreed ? Color.green : Color.gray.opacity(0.3)) // Replaced .brandGreen with standard for portability
                    .frame(width: 24, height: 24)

                if isAgreed {
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
        }
        .buttonStyle(.plain)
    }

    private var agreementText: some View {
        // Concatenated Text for multi-color support
        Text("By tapping ")
            .foregroundStyle(.gray)
        + Text("“Sign Up”")
            .foregroundStyle(.customOrange) // Replaced .customOrange
            .fontWeight(.bold)
        + Text(" you agree with\n")
            .foregroundStyle(.gray)
        + Text("Terms & Conditions")
            .foregroundStyle(.brandGreen)
            .fontWeight(.bold)
            .underline(true, color: .green)
    }
}

// MARK: - Preview
#Preview {
    SignUpView()
}
