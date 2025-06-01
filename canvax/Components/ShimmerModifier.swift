import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .redacted(reason: .placeholder)
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .white.opacity(0.5), location: 0.5),
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
                                        .init(color: .clear, location: 1)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .offset(x: phase)
                    )
                    .blendMode(.overlay)
                    .onAppear {
                        withAnimation(
                            .linear(duration: 1.5)
                            .repeatForever(autoreverses: false)
                        ) {
                            phase = geometry.size.width * 2
                        }
                    }
                }
            )
    }
}

extension View {
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}

#Preview {
    VStack(spacing: 20) {
        Text("Hello World")
            .font(.title)
            .shimmer()
        
        HStack {
            Circle()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.headline)
                Text("Subtitle")
                    .font(.subheadline)
            }
        }
        .shimmer()
        
        Image(systemName: "star.fill")
            .font(.largeTitle)
            .shimmer()
    }
    .padding()
} 