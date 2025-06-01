import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Calendar")
                    .font(.largeTitle)
                    .bold()
                // Add your calendar content here
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CalendarView()
        .preferredColorScheme(.dark)
} 