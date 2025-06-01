//
//  ArtsPost.swift
//  canvax
//
//  Created by valome on 5/28/25.
//

import SwiftUI

struct ArtsPostView: View {
    let art: ArtPost
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background image
            Image(art.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 347, height: 481)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            
            // Overlay InfoSet at bottom
            InfoSet(
                title: art.title,
                artist: art.artist,
                location: art.location,
                likes: art.likes,
                comments: art.comments,
                shares: art.shares
            )
        }
        .frame(width: 347, height: 481) // Ensure ZStack matches image frame
    }
}

#Preview {
    ArtsPostView(art: ArtPost.sampleData[0])
}
