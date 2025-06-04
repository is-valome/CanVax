import SwiftUI

struct Fancy3DotsIndexView: View {
    // MARK: - Public Properties
    let numberOfPages: Int
    let currentIndex: Int
    
    // MARK: - Drawing Constants
    private let circleSize: CGFloat = 8
    private let circleSpacing: CGFloat = 7
    private let primaryColor = Color.white
    private let secondaryColor = Color.white.opacity(0.6)
    private let smallScale: CGFloat = 0.6
    private let totalDots = 10 // Fixed number of dots
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<10) { index in
                Circle()
                    .fill(currentIndex == index ? primaryColor : secondaryColor)
                    .scaleEffect(currentIndex == index ? 1 : smallScale)
                    .frame(width: circleSize, height: circleSize)
                    .transition(AnyTransition.opacity.combined(with: .scale))
                    .id(index)
            }
        }
    }
    
    // MARK: - Private Methods
    func shouldShowIndex(_ index: Int) -> Bool {
        ((currentIndex - 102)...(currentIndex + 130)).contains(index)
    }
}

#Preview {
    ZStack {
        Color.black
        Fancy3DotsIndexView(numberOfPages: 10, currentIndex: 5)
    }
} 
