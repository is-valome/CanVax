//
//  StandOutShadow.swift
//  canvax
//
//  Created by valome on 6/1/25.
//

import SwiftUI

struct StandOutShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 2) // soft shadow
            .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 2) // subtle highlight
    }
}

extension View {
    func standOutShadow() -> some View {
        self.modifier(StandOutShadow())
    }
}
