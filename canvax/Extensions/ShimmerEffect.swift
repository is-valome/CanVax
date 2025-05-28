import SwiftUI

struct ShimmerEffect: View {
    @State private var phase: CGFloat = 0
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: .clear, location: 0),
                .init(color: .white.opacity(0.95), location: 0.5),
                .init(color: .white.opacity(0.95), location: 0.7),
                .init(color: .clear, location: 1)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .mask(
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .white, location: 0.5),
                            .init(color: .white, location: 0.7),
                            .init(color: .clear, location: 1)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .offset(x: phase)
        )
        .blendMode(.overlay)
        .brightness(0.5)
        .onAppear {
            withAnimation(
                .linear(duration: 3)
                .repeatForever(autoreverses: false)
            ) {
                phase = 500
            }
        }
    }
}

#Preview {
    ShimmerEffect()
        .frame(width: 200, height: 50)
} 
