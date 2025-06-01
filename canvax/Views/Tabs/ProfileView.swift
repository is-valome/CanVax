import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                // Add your profile content here
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
} 