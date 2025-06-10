//
//  AddFriendsProfileView.swift
//  canvax
//
//  Created by valome on 6/9/25.
//

import SwiftUI


// MARK: - AddFriends

struct AddFriendsProfileView: View {
    let artPost: ArtPost
    @Environment(\.colorScheme) var colorScheme
    var onFollowStateChanged: (Bool) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack{
                    Image(artPost.profileImage)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .strokeBorder(colorScheme == .dark ? Color(hex: "414141") : Color.white, lineWidth: 9, antialiased: true)
                                .shadow( // <- moved here
                                      color: colorScheme == .dark ? Color.black.opacity(0.5) : Color.black.opacity(0.2),
                                      radius: 15, x: 0, y: 5
                                  )
                        )
                }
                .frame(maxHeight: .infinity)
                
                TransparentBlurView()
                    .frame(width: geometry.size.width - 18)
                    .frame(height: 320)
                    .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                    .mask(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color.appLinearAsh.opacity(0.00), location: 0.00),
                                .init(color: Color.appLinearBlack, location: 0.55)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .offset(y: -9)
                
                // Content
                VStack{
                    ContentInfo(artPost: artPost)
                    ContentAction(artPost: artPost, onFollowStateChanged: onFollowStateChanged)
                }
            }
            .frame(width: 347)
            .frame(maxHeight: .infinity)
        }
        .frame(width: 347)
        .frame(maxHeight: .infinity)
    }
}

// MARK: - ContentInfo

struct ContentInfo: View {
    let artPost: ArtPost
    
    var body: some View {
        VStack{
            HStack{
                Text(artPost.artist)
                    .tracking(0.21)
                Image(systemName: "star.circle.fill")
                    .font(.system(size: 18))
            }
            .foregroundStyle(Color.white)
            .font(.system(size: 21))
            .padding(.horizontal, 18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: 25)
            .shadow(color: .black.opacity(0.1), radius: 2, x: 2, y: 1)
            HStack {
                Text(artPost.bio)
                    .tracking(0.26)
            }
            .foregroundStyle(Color.white)
            .font(.system(size: 13))
            .padding(.horizontal, 18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
        }
        .padding(.vertical)
    }
}

// MARK: - ContentAction

struct ContentAction: View {
    @State private var isFollowing = false
    @State private var showUnfollowAlert = false
    let artPost: ArtPost
    var onFollowStateChanged: (Bool) -> Void
    
    var body: some View {
        HStack() {
            HStack{
                Image(systemName: "plus.square.fill.on.square.fill")
                Text("\(artPost.followers)") // artist number of followers
            }
            .foregroundStyle(Color.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            HStack{
                Image(systemName: "paintpalette.fill")
                Text("\(artPost.artsCount)") // artist number of arts
            }
            .foregroundStyle(Color.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            Spacer()
            Button(action: {
                let impact = UIImpactFeedbackGenerator(style: .medium)
                impact.impactOccurred()
                
                if isFollowing {
                    showUnfollowAlert = true
                } else {
                    isFollowing = true
                    onFollowStateChanged(true)
                }
            }) {
                ZStack {
                    HStack(spacing: 8) {
                        if !isFollowing {
                            Image(systemName: "plus.square.fill.on.square.fill")
                                .frame(width: 20, height: 20)
                            Text("Follow")
                                .font(.system(size: 17, weight: .regular))
                        }
                    }
                    
                    if isFollowing {
                        Text("Following")
                            .font(.system(size: 17, weight: .regular))
                    }
                }
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(Color.white)
                .cornerRadius(40)
            }
            .alert("UnFollow \(artPost.artist)?", isPresented: $showUnfollowAlert) {
                Button("Cancel", role: .cancel) { }
                Button("UnFollow", role: .destructive) {
                    isFollowing = false
                    onFollowStateChanged(false)
                }
            } message: {
                Text("Are you sure you want to unfollow \(artPost.artist)?")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}
// MARK: - FullAddFriends
struct FullAddFriendsProfileView: View {
    var onFollowStateChanged: (Bool) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(ArtPost.sampleData.prefix(3))) { artPost in
                    AddFriendsProfileView(artPost: artPost, onFollowStateChanged: onFollowStateChanged)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 481)
    }
}

// FUNCTION
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// Add Color extension for hex support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - PREVIEWS
#Preview("AddFriends") {
    AddFriendsProfileView(artPost: ArtPost.sampleData[0], onFollowStateChanged: { _ in })
}

#Preview("ContentInfo") {
    ContentInfo(artPost: ArtPost.sampleData[0])
}

#Preview("ContentAction"){
    ContentAction(artPost: ArtPost.sampleData[3], onFollowStateChanged: { _ in })
}

#Preview("FullAddFriends"){
    FullAddFriendsProfileView(onFollowStateChanged: { _ in })
}
