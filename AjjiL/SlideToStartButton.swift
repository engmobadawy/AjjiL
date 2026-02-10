//import SwiftUI
//
//struct SlideToStartButton: View {
//    // MARK: - Configuration
//    private let themeColor = Color(red: 1/255, green: 150/255, blue: 131/255)
//    private let handleSize: CGFloat = 64
//    private let padding: CGFloat = 8
//    
//    // MARK: - State
//    @State private var offset: CGFloat = 0
//    @State private var isDragging = false
//    @State private var didComplete = false
//    
//    // MARK: - Action
//    var onSwipeSuccess: () -> Void = { print("Start experience") }
//
//    var body: some View {
//        GeometryReader { proxy in
//            let trackWidth = proxy.size.width
//            let maxSlideDistance = trackWidth - handleSize - (padding * 2)
//            
//            ZStack(alignment: .leading) {
//                // 1. Track Background
//                TrackView(
//                    themeColor: themeColor,
//                    isDragging: isDragging,
//                    height: proxy.size.height
//                )
//                
//                // 2. Label
//                if !didComplete {
//                    Text("Start Experience")
//                        .font(.title3.bold())
//                        .foregroundStyle(.white)
//                        .frame(maxWidth: .infinity)
//                        .opacity(fadeOpacity(maxDistance: maxSlideDistance))
//                        .animation(.easeOut(duration: 0.3), value: offset)
//                }
//                
//                // 3. Sliding Handle
//                HandleView(size: handleSize)
//                    .offset(x: offset)
//                    .padding(.leading, padding)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                handleDragChange(value, limit: maxSlideDistance)
//                            }
//                            .onEnded { value in
//                                handleDragEnd(value, limit: maxSlideDistance)
//                            }
//                    )
//            }
//            // Vertical centering for the GeometryReader container
//            .frame(height: 80)
//            .frame(maxHeight: .infinity)
//        }
//        .frame(height: 80) // intrinsic height
//        .padding()
//        .sensoryFeedback(.success, trigger: didComplete)
//        .sensoryFeedback(.impact(weight: .light), trigger: isDragging)
//    }
//    
//    // MARK: - Logic
//    
//    private func handleDragChange(_ value: DragGesture.Value, limit: CGFloat) {
//        if didComplete { return }
//        isDragging = true
//        // Constrain offset between 0 and limit
//        let newOffset = value.translation.width
//        offset = min(max(newOffset, 0), limit)
//    }
//    
//    private func handleDragEnd(_ value: DragGesture.Value, limit: CGFloat) {
//        if didComplete { return }
//        isDragging = false
//        
//        // Threshold: 70% of the way
//        if offset > limit * 0.7 {
//            completeAction(limit: limit)
//        } else {
//            resetHandle()
//        }
//    }
//    
//    private func completeAction(limit: CGFloat) {
//        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
//            offset = limit
//            didComplete = true
//        }
//        
//        
//        // Delay action slightly to allow animation to settle
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            
//            onSwipeSuccess()
//        }
//    }
//    
//    private func resetHandle() {
//        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
//            offset = 0
//        }
//    }
//    
//    private func fadeOpacity(maxDistance: CGFloat) -> Double {
//        // Fade out text as we slide; fully invisible by 50% slide
//        let progress = offset / maxDistance
//        return 1.0 - (progress * 2)
//    }
//}
//
//// MARK: - Subviews
//
///// The visual track background
//struct TrackView: View {
//    let themeColor: Color
//    let isDragging: Bool
//    let height: CGFloat
//    
//    var body: some View {
//        Capsule()
//            .fill(themeColor)
//            .frame(height: height)
//            .scaleEffect(isDragging ? 0.98 : 1.0)
//            .animation(.spring(duration: 0.2), value: isDragging)
//    }
//}
//
///// The circular handle with the chevron animation
//struct HandleView: View {
//    let size: CGFloat
//    
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(.white)
//                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
//            
//            ChevronIndicator()
//        }
//        .frame(width: size, height: size)
//    }
//}
//
///// The three-chevron animated indicator
//struct ChevronIndicator: View {
//    @State private var animate = false
//    
//    var body: some View {
//        HStack(spacing: -4) {
//            ForEach(0..<3) { index in
//                Image(systemName: "chevron.right")
//                    .font(.system(size: 16, weight: .bold)) // Matches the ">>>" look
//                    .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.2))
//                    .opacity(animate ? 1.0 : 0.3)
//                    .animation(
//                        .easeInOut(duration: 1.0)
//                        .repeatForever()
//                        .delay(Double(index) * 0.2),
//                        value: animate
//                    )
//            }
//        }
//        .onAppear {
//            animate = true
//        }
//    }
//}
//
//#Preview {
//    ZStack {
//        Color.black.ignoresSafeArea()
//        SlideToStartButton()
//    }
//}
