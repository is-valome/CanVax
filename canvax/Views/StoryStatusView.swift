import SwiftUI

struct StoryStatusView: View {
    let stories: [StoryStatus]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 2) {
                ForEach(stories) { story in
                    VStack(spacing: 6.75) {
                        ZStack {
                            // MARK: - Border Ring
                            Circle()
                                .stroke(
                                    LinearGradient(
                                        colors: story.isViewed
                                            ? [.gray.opacity(0.5)]
                                            : [.accentBlueM, .highlightYellowM, .primaryColorM],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    style: story.strokeStyle.style
                                )
                                .frame(width: 101.19, height: 101.19)

                            // MARK: - Story Thumbnail
                            Image(story.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 93, height: 93)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.appStrokeCircle, lineWidth: 0.42)
                                )

                        }

                        // MARK: - Story Name
                        Text(story.name)
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .tracking(0.4)
                    }
                    .padding(.horizontal, 6.07)
                    .padding(.vertical, 5.4)
                }
            }
        }
    }
}

#Preview("⭐️ Story Thumbnails", traits: .sizeThatFitsLayout) {
    StoryStatusView(stories: StoryStatus.sampleData)
        .padding(.leading, 7)
        .padding(.vertical, 10)
}
