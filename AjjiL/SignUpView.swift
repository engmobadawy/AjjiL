//
//  SignUpView .swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 10/02/2026.
//


import SwiftUI

struct SignUpView: View {
    @State private var username = "louisanderson"
    @State private var eMail  = "appssquare.com"
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var ConfermationPassword: String = ""
  

    @State  var isAgreed: Bool 
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                TopRow()
                    .background(  Image("background"))
                
                ScrollView {
                    VStack(spacing: 18) {
                        headerSection
                        
                       
                        
                        CustomTextField(
                                        text: $username,
                                        placeholder: "louisanderson",
                                        icon: Image(systemName: "person.fill"),
                                        backgroundColor: .goodGray,
                                        strokeColor: .clear,
                                        keyboardType: .default,
                                        submitLabel: .next
                                    )
                                    .frame(maxWidth: .infinity)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                    
                        PhoneTextField(
                            text: $phone,
                            backgroundColor: Color(.goodGray),
                            strokeColor: nil,
                            keyboardType: .phonePad,
                            submitLabel: .next
                        )

                                    CustomTextField(
                                        text: $eMail,
                                        placeholder: "appssquare.com",
                                        icon: Image(systemName: "envelope.fill"),
                                        backgroundColor: .goodGray,
                                        strokeColor: nil,
                                        keyboardType: .emailAddress,
                                        submitLabel: .next
                                    )
                                    .frame(maxWidth: .infinity)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                        
                        
                        SecureCustomTextField(
                                   text: $password,
                                   placeholder: "Password",
                                   backgroundColor: .goodGray,
                                   strokeColor: nil
                               )

                               SecureCustomTextField(
                                   text: $ConfermationPassword,
                                   placeholder: "confirm Password",
                                   backgroundColor:.goodGray,
                                   strokeColor: .green
                               )
                                   
                        
                        
                        
                        
                        GreenButton(title: "SIGN UP", action: {})
                        TermsAgreementView(isAgreed: $isAgreed, onLoginTapped: {}, onAgreementTapped: {})
                        WhiteButton(title: "SIGN IN", action: {})
                    }
                    .padding(.top, 16)
                    .padding(.horizontal , 18)
                  
                }
                .scrollIndicators(.hidden)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(.white))
                )
                
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    
}


#Preview {
    
SignUpView(isAgreed: false)
}

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
                    .foregroundStyle(Color(uiColor: .lightGray))
            }
        }
       
    }

    // MARK: - Toggle
    private var toggleButton: some View {
        Button {
            withAnimation(.snappy) {
                isAgreed.toggle()
                onAgreementTapped()
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

    // MARK: - Text
    private var agreementText: some View {
        (
            Text("By tapping ")
                .foregroundStyle(.gray)
            + Text("“Sign Up”")
                .foregroundStyle(.customOrange)
                .fontWeight(.bold)
            + Text(" you agree with\n")
                .foregroundStyle(.gray)
            + Text("Terms&Condition")
                .foregroundStyle(.brandGreen)
                .fontWeight(.bold)
                .underline(true, color: .brandGreen)
        )
        .font(.system(size: 20))
        .lineSpacing(4)
        .multilineTextAlignment(.leading)
        .fixedSize(horizontal: false, vertical: true)
        
    }
}


private var headerSection: some View {
    VStack(alignment: .leading, spacing: 8) {
        Text("Create Your Account")
            .font(.title.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        Text("Type your data to access all services")
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}




