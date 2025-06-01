//
//  ProfileFriends.swift
//  canvax
//
//  Created by valome on 6/1/25.
//

import SwiftUI

struct ProfileFriends: View {
    var profile: String  // Use a String for the image name
    var index: Int // Added to help manage zIndex

    
    var body: some View {
        Circle()
            .foregroundStyle(.ultraThinMaterial)
            .overlay {
                Image(profile)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(1.25)
            }
            .frame(width: 50, height: 50)
            .zIndex(Double(index)) // Higher index = on top

    }
}

// Created SetProfileFriends using ProfileFriends

struct SetProfileFriends: View {
    let profiles = ["profile1", "profile2", "profile3", "profile4"]

    var body: some View {
        HStack(spacing: -14) {
            ForEach(Array(profiles.enumerated()), id: \.offset) { i, name in
                // Reverse index: highest zIndex for first profile
                let reversedIndex = profiles.count - 1 - i
                ProfileFriends(profile: name, index: reversedIndex)
            }
        }
    }
}

// MARK: - Preview with multiple profiles
#Preview(traits: .sizeThatFitsLayout) {
   SetProfileFriends()
        .padding()
}
        
