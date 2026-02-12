import SwiftUI

struct SignInView: View {

    @State private var phone: String = ""
    @State private var password: String = ""

    @State var isAgreed: Bool

    // Actions
    var onForgotPasswordTapped: () -> Void = {}
    var onCreateAccountTapped: () -> Void = {}

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TopRow()
                    .background(Image("background"))

                ScrollView {
                    VStack(spacing: 18) {
                        headerSection

                        PhoneTextField(
                            text: $phone,
                            backgroundColor: Color(.goodGray),
                            strokeColor: nil,
                            keyboardType: .phonePad,
                            submitLabel: .next
                        )

                        SecureCustomTextField(
                            text: $password,
                            placeholder: "Password",
                            backgroundColor: .goodGray,
                            strokeColor: nil
                        )

                        GreenButton(title: "SIGN IN", action: {})

                 
                        Button(action: onForgotPasswordTapped) {
                            Text("Forgot Password?")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.customOrange)
                                .underline(true, color: .customOrange)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 6)

                        VStack(spacing: 14) {
                            Button(action: {}) {
                                Text("Don’t Have An Account?")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundStyle(Color(uiColor: .lightGray))
                            }

                            WhiteButton(title: "CREATE AN ACCOUNT", action: onCreateAccountTapped)
                        }
                        .padding(.top, 48)

                        Spacer(minLength: 8)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 18)
                }
                .scrollIndicators(.hidden)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(.white))
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignInView(isAgreed: false)
}

private var headerSection: some View {
    VStack(alignment: .leading, spacing: 8) {
        Text("Welcome back")
            .font(.title.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        Text("Let's get you in to access all services.")
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}
