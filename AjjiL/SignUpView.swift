//
//  SignUpView.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 09/02/2026.
//

import SwiftUI

struct SignUpView: View {
    private let barHeight: CGFloat = 26
    private let extraTop: CGFloat = 80

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

     
            VStack {
                SignUpScreen()
                
            }
            .safeAreaPadding(.top, barHeight + extraTop)
        }
        .overlay(alignment: .top) {
            TopRow(onArabicTapped: {}, onSkipTapped: {})
                .safeAreaPadding(.top, extraTop)
        }
    }
}




#Preview {
    SignUpView()
}
