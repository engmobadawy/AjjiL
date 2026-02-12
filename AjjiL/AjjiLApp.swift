//
//  AjjiLApp.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 09/02/2026.
//

import SwiftUI

@main
struct AjjiLApp: App {
    @State private var showSplash = true
    var body: some Scene {
        WindowGroup {
            ZStack{
                OnboardingView()
                    .opacity(showSplash ? 0 : 1)
                
                if showSplash {
                              SplashView()
                                  .transition(.opacity)
                          }
                      }
                      .task {
                          guard showSplash else { return }
                          try? await Task.sleep(for: .milliseconds(700))
                          withAnimation(.easeOut(duration: 0.35)) {
                              showSplash = false
                          }
                
                
            }
            
        }
    }
}
