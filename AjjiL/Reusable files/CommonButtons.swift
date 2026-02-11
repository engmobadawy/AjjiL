//
//  PrimaryActionButton.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 09/02/2026.
//


import SwiftUI

struct GreenButton: View {
    let title: String
    var isEnabled: Bool = true
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
        }
        .buttonStyle(GreenActionButtonStyle(isEnabled: isEnabled))
        .disabled(!isEnabled)
        .animation(.easeInOut, value: isEnabled)
        .padding(.top, 16)
    }
}



struct WhiteButton: View {
    let title: String
    var isEnabled: Bool = true
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.brandGreen)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
        }
        .buttonStyle(WhiteActionButtonStyle(isEnabled: isEnabled))
        .disabled(!isEnabled)
        .animation(.easeInOut, value: isEnabled)
        .padding(.top, 16)
    }
}


private struct GreenActionButtonStyle: ButtonStyle {
    let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
//                    .fill(isEnabled ? Color.green : Color.gray.opacity(0.4))
                    .fill(.brandGreen )
            }
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
    }
}


private struct WhiteActionButtonStyle: ButtonStyle {
    let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
//                    .fill(isEnabled ? Color.green : Color.gray.opacity(0.4))
                    .fill(.white )
            }
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
    }
}
