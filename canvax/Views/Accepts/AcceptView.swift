//
//  AcceptView.swift
//  canvax
//
//  Created by valome on 6/8/25.
//

import SwiftUI

struct AcceptView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    @State private var showExitAlert = false
    @State private var showInstagramSyncAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {
                    let impact = UIImpactFeedbackGenerator(style: .medium)
                    impact.impactOccurred()
                    pd_print("Close button tapped")
                    showExitAlert = true
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

            Text("CanVax is better with\nfriends 😩")
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

            VStack(spacing: 21) {
                Image("instagram_canvax.2x")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(7)

                VStack(spacing: 8) {
                    Text("Find Instagram friends")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(10)

                    Text("Sync your Instagram friends on CanVax to connect with the people you already know—whether they're your close friends or co-journal artists. Share your creative journey by staying connected and inspired together.")
                        .font(.system(size: 13))
                        .tracking(0.26)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
            .frame(maxWidth: .infinity)

            Spacer().frame(height: 220)

            HStack(spacing: 16) {
                Button(action: {
                    dismiss()
                    // Navigate to CheckthemoutView
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = windowScene.windows.first {
                        window.rootViewController = UIHostingController(rootView: CheckthemoutView())
                    }
                }) {
                    Text("Skip")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .cornerRadius(12)
                }

                Button(action: {
                    showInstagramSyncAlert = true
                }) {
                    Text("Sync")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding(10)
        }
        .alert("Do you want to stop the SetUp of you Account to get to use CanVax that fast 🤣", isPresented: $showExitAlert) {
            Button("No", role: .cancel) { }
            Button("Yes", role: .destructive) {
                dismiss()
            }
        } message: {
            Text("")
        }
        .alert("You are going to Instagram to approve the Sync", isPresented: $showInstagramSyncAlert) {
            Button("No", role: .cancel) { }
            Button("Yes", role: .none) {
                dismiss()
                // Navigate to CheckthemoutView
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.rootViewController = UIHostingController(rootView: CheckthemoutView())
                }
            }
        } message: {
            Text("")
        }
    }
}

#Preview {
    AcceptView()
}

