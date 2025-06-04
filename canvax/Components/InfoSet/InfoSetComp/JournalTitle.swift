//
//  JournalTitle.swift
//  canvax
//
//  Created by valome on 6/1/25.
//

import SwiftUI

struct JournalTitle: View {
    var journaltitle: String // reusable journaltitle for art post
    
    var body: some View {
        Text(journaltitle)
            .font(.system(size: 12))
            .tracking(0.24)
            .foregroundStyle(.white)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 3, y: 1)

        
    }
}

#Preview(traits: .sizeThatFitsLayout){
    
    JournalTitle(journaltitle: "My day was not a good day but I can to you true my art")
        .padding()
        .background(.black)
}
