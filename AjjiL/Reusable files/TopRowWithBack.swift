//
//  TopRow 2.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 10/02/2026.
//


import SwiftUI
struct TopRow: View {
    var onArabicTapped: () -> Void = {}
    var onSkipTapped: () -> Void = {}

    var body: some View {
        HStack {
            Button("عربي", action: onArabicTapped)
                .frame(maxWidth: .infinity, alignment: .leading)

            Image("navigationLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 28)

            Button("Skip", action: onSkipTapped)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.headline)
        .frame(height: 70)
        .padding(.horizontal, 18)
        .foregroundStyle(.black)
    }
}

#Preview {
    TopRow(onArabicTapped: {}, onSkipTapped: {})
}
