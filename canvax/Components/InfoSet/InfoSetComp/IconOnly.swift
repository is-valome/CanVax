//
//  IconOnly.swift
//  canvax
//
//  Created by valome on 6/1/25.
//

import SwiftUI

struct IconOnly: View {
    var icononly: String
    
    var body: some View {
        Circle()
            .foregroundStyle(.clear)
            .overlay {
                Image(systemName: icononly)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white) // Apply color here
                    .padding()
                    .standOutShadow() // 🔥 standsout
            }
            .frame(width: 35, height: 35)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HStack {
        IconOnly(icononly: "plus.square.fill.on.square.fill")
        IconOnly(icononly: "heart.fill")
    }
    .padding()
}
