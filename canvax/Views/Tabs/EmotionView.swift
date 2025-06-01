import SwiftUI

struct EmotionView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Emotion")
                    .font(.largeTitle)
                    .bold()
                // Add your emotion content here
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    EmotionView()
        .preferredColorScheme(.dark)
} 