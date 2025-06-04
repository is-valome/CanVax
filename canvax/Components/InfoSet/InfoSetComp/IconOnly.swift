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
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2)
            }
            .frame(width: 35, height: 35)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HStack {
        IconOnly(icononly: "plus.square.fill.on.square.fill")
        Spacer().frame(width: 10)
        IconOnly(icononly: "heart.fill")
    }
    .padding()
}
