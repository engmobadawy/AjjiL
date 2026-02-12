import SwiftUI

struct OnboardingView: View {
    @State private var showSignUp = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                Image("onboarding1")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 36)
                
                VStack(spacing: 28) {
                    
                    VStack(spacing: 12) {
                        Text("Best Quality At\nYour Hand!")
                            .font(.system(size: 32, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.primary)
                        
                        Text("Explore the top collection of ")
                            .foregroundStyle(.secondary)
                        + Text("AJJIL\n")
                            .foregroundStyle(.orange)
                            .fontWeight(.semibold)
                        + Text("and buy and sell your items as well. ")
                            .foregroundStyle(.secondary)
                    }
                    
                    SlideToStartButton {
                        showSignUp = true
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
                .offset(y: -60)
                
                Spacer()
            }
            .background(Color(.systemBackground))
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $showSignUp) {
                SignUpView(isAgreed: false)
            }
        }
        
    }
}

#Preview {
    OnboardingView()
}

