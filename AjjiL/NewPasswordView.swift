////
////  NewPasswordView.swift
////  AjjiL
////
////  Created by mohamed mahmoud sobhy badawy on 11/02/2026.
////
//
//
//
//import SwiftUI
//
//struct NewPasswordView: View {
//    @State private var password: String = ""
//    @State private var ConfermationPassword: String = ""
//  
//
//    var body: some View {
//        NavigationStack{
//            VStack(spacing: 0) {
//                TopRowWithBack()
//                    .background(  Image("background"))
//                
//                ScrollView {
//                    VStack(spacing: 18) {
//                        headerSection
//                        
//                    
//                        
//                        
//                        SecureCustomTextField(
//                                   text: $password,
//                                   placeholder: "Password",
//                                   backgroundColor: .goodGray,
//                                   strokeColor: nil
//                               )
//
//                               SecureCustomTextField(
//                                   text: $ConfermationPassword,
//                                   placeholder: "confirm Password",
//                                   backgroundColor:.goodGray,
//                                   strokeColor: .green
//                               )
//                                   
//                        
//                        
//                        
//                        
//                        GreenButton(title: "Save", action: {})
//                        
//                    }
//                    .padding(.top, 16)
//                    .padding(.horizontal , 18)
//                  
//                }
//                .scrollIndicators(.hidden)
//                .background(
//                    RoundedRectangle(cornerRadius: 28)
//                        .fill(Color(.white))
//                )
//                
//            }
//        }.navigationBarBackButtonHidden(true)
//    }
//    
//    
//}
//
//
//#Preview {
//    NewPasswordView()
//
//}
//
//
//
//
//
//
//
//
//    
//    private var headerSection: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text("Set a new password")
//                .font(.title.bold())
//                .frame(maxWidth: .infinity, alignment: .leading)
//            
//            Text("Type your new password and be confirm to remember it later.")
//                .foregroundStyle(.secondary)
//                .frame(maxWidth: .infinity, alignment: .leading)
//        }
//    }
//    
//    
//    
//
//    
//    
//    
//
//
//
//
