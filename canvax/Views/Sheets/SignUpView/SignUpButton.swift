//
//  SignUpButtons.swift
//  canvax
//
//  Created by valome on 6/7/25.
//

import SwiftUI

struct SignUpButton: View {
    @Environment(\.colorScheme) var colorScheme // 👈 Detect light/dark mode

    var logo: String
    var buttonText: String
    var action: () -> Void
    var platform: String? // 👈 Add platform parameter

    var body: some View {
        VStack {
            Button(action: {
                // Haptic feedback
                let impact = UIImpactFeedbackGenerator(style: .medium)
                impact.impactOccurred()
                
                // Custom action
                action()
            }) {
                HStack(spacing: 16) {
                    if getPlatformIcon().contains(".") { // Simple check to differentiate SF Symbols from custom assets
                        Image(systemName: getPlatformIcon())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19.37, height: 23.00)
                    } else {
                        Image(getPlatformIcon())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19.37, height: 23.00)
                    }
                    Text(buttonText)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 61)
                .foregroundColor(getForegroundColor())
                .background(
                    Group { // Use Group to conditionally apply background
                        if platform?.lowercased() == "instagram" && colorScheme == .light {
                            Image("RadientMix2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else {
                            getBackgroundColor()
                        }
                    }
                )
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(red: 224/255, green: 224/255, blue: 233/255), lineWidth: 1)
                        .opacity(platform?.lowercased() == "google" && colorScheme == .light ? 1 : 0) // Apply only for Google in light mode
                )
                .shadow(color: Color(red: 131/255, green: 119/255, blue: 198/255).opacity(0.11), radius: 30, x: 0, y: 18)
            }
        }
    }
    
    // Helper function to get platform-specific icon
    private func getPlatformIcon() -> String {
        switch platform?.lowercased() {
        case "google":
            return colorScheme == .light ? "google_canvax" : "google_w_canvax"
        case "instagram":
            return colorScheme == .light ? "instagram_w_canvax" : "instagram_canvax" // Corrected Instagram icon logic
        default:
            return logo
        }
    }
    
    // Helper function to get platform-specific background color
    private func getBackgroundColor() -> Color {
        switch platform?.lowercased() {
        case "google":
            return colorScheme == .light ? Color.white : Color(red: 66/255, green: 133/255, blue: 244/255) // Google Blue
        case "instagram":
            return colorScheme == .light ? Color.white : Color.white // Instagram background is gradient in light mode, white in dark mode
        default:
            return colorScheme == .dark ? Color.white : Color.black
        }
    }
    
    // Helper function to get platform-specific foreground color
    private func getForegroundColor() -> Color {
        switch platform?.lowercased() {
        case "google":
            return colorScheme == .light ? Color.black : Color.white
        case "instagram":
            return colorScheme == .light ? Color.white : Color.black
        default:
            return colorScheme == .dark ? Color.black : Color.white
        }
    }
}

#Preview {
    VStack {
        SignUpButton(logo: "apple.logo", buttonText: "Sign up with Apple", action:  {
            pd_print("Tapped Apple Sign Up")
        }, platform: nil)
        SignUpButton(logo: "google_canvax", buttonText: "Sign up with Google", action:  {
            pd_print("Tapped Google Login to Acces CanVax Account")
        }, platform: "google")
        SignUpButton(logo: "instagram_canvax", buttonText: "Sign up with Instagram", action:  {
            pd_print("Tapped Instagram Login to Access CanVax Account")
        }, platform: "instagram")
    }
    .padding()
}
