//
//  ProgressiveBlur.swift
//  canvax
//
//  Created by valome on 6/1/25.
//

import SwiftUI

struct ProgressiveBlur: ViewModifier {
    var radius: CGFloat
    var startOpacity: Double
    var endOpacity: Double

    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .black.opacity(startOpacity), location: 0),
                                .init(color: .black.opacity(endOpacity), location: 1)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .blur(radius: radius)
            )
    }
}


extension View {
    func progressiveBlur(radius: CGFloat, startOpacity: CGFloat = 0.25, endOpacity: CGFloat = 0.5) -> some View {
        modifier(ProgressiveBlur(radius: radius, startOpacity: startOpacity, endOpacity: endOpacity))
    }
}
