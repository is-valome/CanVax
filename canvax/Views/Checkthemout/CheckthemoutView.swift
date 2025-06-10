//
//  CheckthemoutView.swift
//  canvax
//
//  Created by valome on 6/9/25.
//

import SwiftUI

struct CheckthemoutView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    @State private var showSkipAlert = false
    @State private var hasFollowedFriends = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {
                    let impact = UIImpactFeedbackGenerator(style: .medium)
                    impact.impactOccurred()
                    pd_print("Close button tapped")
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 22))
                            .fontWeight(.regular)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Spacer()
                    }
                    .frame(width: 39, height: 44)
                }
            }
            .frame(maxWidth: .infinity)

            Text("Your friends on\nCanVax ⭐️")
                .font(.system(size: 34))
                .fontWeight(.bold)
                .tracking(0.15)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.top, 3)
                .padding(.bottom, 8)

            Divider()

            Spacer()

            VStack(spacing: 21) { // profile's here 🫂
                FullAddFriendsProfileView(onFollowStateChanged: { isFollowing in
                    hasFollowedFriends = isFollowing
                })
            }

            Spacer()

            HStack(spacing: 16) {
                Button(action: {
                    if hasFollowedFriends {
                        // Navigate directly to MainScreen if friends are followed
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = windowScene.windows.first {
                            window.rootViewController = UIHostingController(rootView: MainScreen())
                        }
                    } else {
                        showSkipAlert = true
                    }
                }) {
                    Text("Skip")
                        .font(.headline)
                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color.white : Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding(10)
        }
        .alert("It will be nice if you follow some of your friends ☺️", isPresented: $showSkipAlert) {
            Button("Skip", role: .destructive) {
                // Navigate to MainScreen
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.rootViewController = UIHostingController(rootView: MainScreen())
                }
            }
            Button("Okay", role: .cancel) { }
        }
    }
}


#Preview {
    CheckthemoutView()
}
