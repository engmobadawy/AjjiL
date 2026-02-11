//
//  SignUpView 2.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 10/02/2026.
//


import SwiftUI

struct SignUpView: View {
    private let extraTop: CGFloat = 10

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView{
                VStack{

                   
                    
                }
            }
           
        }
        .safeAreaInset(edge: .top, spacing: -500) {
            VStack(spacing: 0) {
                // Optional extra spacing under the status bar
                Spacer()
                    .frame(height: extraTop)

                TopRow(onArabicTapped: {}, onSkipTapped: {})
            }
        }
    }
}
#Preview {
    SignUpView()
}
