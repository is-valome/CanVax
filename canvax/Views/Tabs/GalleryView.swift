import SwiftUI

struct GalleryView: View {
    @State private var isArts = true
    @State private var shimmerID = UUID()
    @State private var lastScrollOffset: CGFloat = 0
    @State private var isScrolling = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    // CanVax-style header
                    HStack {
                        HStack {
                            Text("Gallery •")
                                .font(.system(size: 34, weight: .bold))
                            Button(action: {
                                print("🔍 DEBUG: Button tapped - Current state: \(isArts ? "Arts" : "Loop")")
                                ScrollHapticManager.shared.light()
                                // Optimize state changes
                                Task { @MainActor in
                                    withAnimation(.smooth(duration: 0.1)) {
                                        isArts.toggle()
                                        shimmerID = UUID()
                                        print("🔄 DEBUG: State changed to: \(isArts ? "Arts" : "Loop")")
                                        print("📱 DEBUG: ShimmerID updated: \(shimmerID)")
                                    }
                                }
                            }) {
                                Text(isArts ? "Arts" : "Loop")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundStyle(Color.appLightGray)
                                    .overlay(
                                        ShimmerEffect()
                                            .id(shimmerID)
                                            .mask(
                                                Text(isArts ? "Arts" : "Loop")
                                                    .font(.system(size: 34, weight: .bold))
                                            )
                                    )
                            }
                        }
                        
                        Spacer()
                                                
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 22)
                        }
                        .foregroundStyle(.primary)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    StoryStatusView(stories: StoryStatus.sampleData)
                        .padding(.leading, 7)
                        .padding(.vertical, 10)
                    
                    Divider()
                        .frame(height: 0.5) // reduce thickness
                        .foregroundStyle(Color.strokeCircle)
                    // MAIN CODE STARTS FROM HERE
                    // Horizontal scrolling couresel art posts with dynamic height
                    
                    ArtsPostView(art:  ArtPost.sampleData[0])
//                    Spacer()

                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    GalleryView()
        .preferredColorScheme(.dark)
} 
