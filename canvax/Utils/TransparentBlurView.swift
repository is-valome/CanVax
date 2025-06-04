//
//  TransparentBlurView.swift
//  canvax
//
//  Created by valome on 6/3/25.
//

import SwiftUI
import UIKit

// MARK: - TransparentBlurView (defined)
struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilters: Bool = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurStyle: UIBlurEffect.Style = (colorScheme == .dark) ? .systemMaterialDark : .systemUltraThinMaterial
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            if let backdropLayer = uiView.layer.sublayers?.first {
                if removeAllFilters {
                    backdropLayer.filters = []
                } else {
                    backdropLayer.filters?.removeAll(where: { String(describing: $0) != "gaussianBlur" })
                }
            }
        }
    }
}
