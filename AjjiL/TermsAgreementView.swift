import SwiftUI

struct TermsAgreementView: View {
    // MARK: - State
    // "Internal view state (must be private)"
    @State private var isAgreed: Bool = true
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            
            // 1. Terms Agreement Row
            HStack(alignment: .top, spacing: 12) {
                toggleButton
                agreementText
            }
            .padding(.horizontal)
            
            // 2. Footer Link
            Button {
                // Action for login
            } label: {
                Text("Already Have An Account?")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color(uiColor: .lightGray)) // Matching the subtle gray
            }
        }
        .padding()
    }
    
    
    
    private var toggleButton: some View {
        Button {
            withAnimation(.snappy) {
                isAgreed.toggle()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(isAgreed ? Color.brandGreen : Color.gray.opacity(0.3))
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
        let prefix = Text("By tapping ")
            .foregroundStyle(.gray)
        
        let signUp = Text("“Sign Up”")
            .foregroundStyle(.customOrange)
            .fontWeight(.bold)
        
        let middle = Text(" you agree with\n")
            .foregroundStyle(.gray)
        
        let terms = Text("Terms&Condition")
            .foregroundStyle(.brandGreen)
            .fontWeight(.bold)
            .underline(true, color: .green)

        return (prefix + signUp + middle + terms)
            .font(.system(size: 16))
            .lineSpacing(4)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }
}

// MARK: - Preview
#Preview {
    TermsAgreementView()
}
