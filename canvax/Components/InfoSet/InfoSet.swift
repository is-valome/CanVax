//
//  InfoSet.swift
//  canvax
//
//  Created by valome on 6/1/25.
//

import SwiftUI

struct InfoSet: View {
    let title: String
    let artist: String
    let location: String
    let likes: Int
    let comments: Int
    let shares: Int
    
    var body: some View {
        VStack(alignment: .leading){
            HStack() {
                IconName(icon: "location.fill", name: location, iconColor: Color.appPrimary)
                Spacer()
                IconName(icon: "profile1", name: artist)
                Spacer()
                // IconOnly
                HStack {
                    IconOnly(icononly: "plus.square.fill.on.square.fill")
                    IconOnly(icononly: "heart.fill")
                }
            }
            .padding(.leading, 10)
            .padding(.top, 10)
            .padding(.trailing, 18)
            HStack{
                SetProfileFriends()
                Spacer()
                JournalTitle(journaltitle: title)
            } // info • submain
            .padding(.horizontal, 10)
            .padding(.top, 6)
            .padding(.bottom, 10)
        }
    } // info • main
}

#Preview(traits: .sizeThatFitsLayout) {
    InfoSet(
        title: "Abstract Dreams",
        artist: "Sarah Chen",
        location: "New York, NY",
        likes: 1243,
        comments: 89,
        shares: 45
    )
    .padding()
    .background(.black)
}
