import SwiftUI

struct PhoneVerificationView: View {
    let phoneNumber: String
    let onVerifyTapped: () -> Void
    let onResendTapped: () -> Void

    @State private var code: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                TopRow()
                    .background(Image("background"))

                ScrollView {
                    VStack(spacing: 0) {

              
                        Image("Verfication")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 230)

                       
                        Text("Verification Code")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top , 38)

             
                        Text("4 digit code has been sent to your phone number \(phoneNumber)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top , 4)

           
                        TextField("Apply code", text: $code)
                            .keyboardType(.numberPad)
                            .padding()
                            .frame(height: 56)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .padding(.top , 28)

            
                        HStack(spacing: 4) {
                            Text("If you didn’t receive code!")
                                .foregroundStyle(.secondary)

                            Button("Resend It", action: onResendTapped)
                                .foregroundStyle(.orange)
                        }
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top , 18)

                        // Verify Button
                        GreenButton(title: "Verify...",action: onVerifyTapped)
                        .padding(.top, 28)
                    }
                    .padding(.top, 48)
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(.white)
                )
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    PhoneVerificationView(phoneNumber: "02303044", onVerifyTapped: {}, onResendTapped: {})
}
