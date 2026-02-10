import SwiftUI
import Observation


@MainActor
@Observable
final class RegistrationViewModel {

    // Inputs
    var username: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""

    // UI State
    var isPasswordVisible: Bool = false
    var isConfirmVisible: Bool = false

    // Output / UI State
    var isLoading: Bool = false
    var errorMessage: String? = nil

   
    var isFormValid: Bool {
        let validName = !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let validEmail = email.contains("@") && email.contains(".")
        let validPass = password.count >= 8
        let validMatch = !password.isEmpty && password == confirmPassword
        return validName && validEmail && validPass && validMatch
    }

    // MARK: Async sign up
    func signUp() async {
        guard isFormValid else { return }

        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            // Simulate an API call (replace with your real networking)
            try await Task.sleep(nanoseconds: 1_000_000_000)

            // If success:
            print("✅ Sign up success (async/await)")

        } catch {
            errorMessage = "Something went wrong. Please try again."
        }
    }
}

// MARK: - Main View
struct SignUpScreen: View {

    @State private var viewModel = RegistrationViewModel()
    @FocusState private var focusedField: Field?

    enum Field: Hashable { case username, phone, email, password, confirm }

    var body: some View {
        ScrollView {
            ScrollView{
                VStack(spacing: 24) {
                    headerSection
                    
                    VStack(spacing: 16) {
                        StandardInput(
                            text: $viewModel.username,
                            icon: "person.fill",
                            placeholder: "Username",
                            brandColor: .green,
                            field: .username,
                            focusedField: $focusedField
                        )
                        .textContentType(.username)
                        .submitLabel(.next)
                        .onSubmit { moveToNextField() }
                        
                        PhoneInput(
                            text: $viewModel.phoneNumber,
                            brandColor: .green,
                            field: .phone,
                            focusedField: $focusedField
                        )
                        .textContentType(.telephoneNumber)
                        .submitLabel(.next)
                        .onSubmit { moveToNextField() }
                        
                        StandardInput(
                            text: $viewModel.email,
                            icon: "envelope.fill",
                            placeholder: "Email Address",
                            brandColor: .green,
                            field: .email,
                            focusedField: $focusedField
                        )
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .submitLabel(.next)
                        .onSubmit { moveToNextField() }
                        
                        PasswordInput(
                            text: $viewModel.password,
                            isVisible: $viewModel.isPasswordVisible,
                            placeholder: "Password",
                            brandColor: .green,
                            field: .password,
                            focusedField: $focusedField
                        )
                        .textContentType(.newPassword)
                        .submitLabel(.next)
                        .onSubmit { moveToNextField() }
                        
                        PasswordInput(
                            text: $viewModel.confirmPassword,
                            isVisible: $viewModel.isConfirmVisible,
                            placeholder: "Confirm Password",
                            brandColor: .green,
                            field: .confirm,
                            focusedField: $focusedField
                        )
                        .textContentType(.newPassword)
                        .submitLabel(.go)
                        .onSubmit { moveToNextField() }
                    }
                    
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    GreenButton(title: viewModel.isLoading ? "Signing Up..." : "Sign Up") {
                        focusedField = nil
                        Task { await viewModel.signUp() }
                    }
                    .disabled(!viewModel.isFormValid || viewModel.isLoading)
                    .opacity((!viewModel.isFormValid || viewModel.isLoading) ? 0.6 : 1)
                    
                    
                    TermsAgreementView()
                }
                .padding(24)
            }}
        .scrollDismissesKeyboard(.interactively)
        .onTapGesture { focusedField = nil }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button {
                    moveToNextField()
                } label: {
                    Text(focusedField == .confirm ? "Done" : "Next")
                        .font(.body.weight(.semibold))
                        .foregroundStyle(Color.green)
                }
            }
        }
    }

    // MARK: Focus Navigation
    private func moveToNextField() {
        switch focusedField {
        case .username:
            focusedField = .phone
        case .phone:
            focusedField = .email
        case .email:
            focusedField = .password
        case .password:
            focusedField = .confirm
        case .confirm:
            focusedField = nil
            Task { await viewModel.signUp() }
        case .none:
            focusedField = .username
        }
    }

    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("Create Your Account")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Type your data to access all services")
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
