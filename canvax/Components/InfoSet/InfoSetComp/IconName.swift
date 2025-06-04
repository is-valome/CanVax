//
//  IconName.swift
//  canvax
//
//  Created by valome on 6/1/25.
//

import SwiftUI

struct IconName: View {
    var icon: String           // icon can be an SF Symbol or an asset image
    var name: String           // name to display next to the icon
    var iconColor: Color = .primary // color for SF Symbol icons, default to .primary
    
    var body: some View {
        HStack(spacing: 8) {
            // MARK: - Icon Section
            VStack {
                if UIImage(systemName: icon) != nil {
                    // SF Symbol with circular blur and iconColor
                    Circle()
                        .foregroundStyle(Color.gray.opacity(0.4))
                        .overlay {
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(iconColor) // Apply color here
                                .padding()
                        }
                        .frame(width: 28, height: 28)
                } else {
                    // Asset image (e.g., profile image)
                    Circle()
                        .foregroundStyle(.whiteM) // Assuming custom material
                        .overlay {
                            Image(icon)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .padding(0.49)
                        }
                        .frame(width: 28, height: 28)
                }
            }
            .padding(.horizontal, 3.43)
            .padding(.vertical, 3.43)
            
            // MARK: - Text Section
            VStack {
                Text(name)
                    .font(.system(size: 12))
                    .tracking(0.2)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .shadow(color: .black.opacity(0.2), radius: 1, x: 3, y: 1)

            }
            .padding(.leading, 3)
            .padding(.trailing, 17)
            .padding(.vertical, 10)
        }
        .background(TransparentBlurView().clipShape(RoundedRectangle(cornerRadius: 40)))
        .background(Color.white.opacity(0.2).clipShape(RoundedRectangle(cornerRadius: 40)))
    }
}

// MARK: - Preview
#Preview(traits: .sizeThatFitsLayout) {
    ZStack {
        Image("Art1")
            .resizable()
            .scaledToFit()
        TransparentBlurView()
            .scaledToFill()

        HStack {
            IconName(icon: "location.fill", name: "Las Vegas, NV", iconColor: Color.appPrimary)
            IconName(icon: "profile1", name: "Sori")
        }
        .padding()
//        .background(.black)
    }
}
