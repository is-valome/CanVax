//
//  LaunchScreen.swift
//  canvax
//
//  Created by valome on 5/26/25.
// Initial start

import SwiftUI

struct LaunchScreen: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Image(colorScheme == .dark ? "black_canvax" : "white_canvax")
            .resizable()
            .scaledToFit()
            .frame(width: 128, height: 128)
    }
}

#Preview {
    LaunchScreen()
}
