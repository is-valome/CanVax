import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Activities")
                    .font(.largeTitle)
                    .bold()
                // Add your activities content here
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ActivitiesView()
        .preferredColorScheme(.dark)
} 