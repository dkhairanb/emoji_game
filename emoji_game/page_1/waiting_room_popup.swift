//
//  Pop Up 3.swift
//  emoji_game
//
//  Created by Aysha Hafizhatul on 25/03/23.
//

import SwiftUI

struct waiting_room_popup: View {
    var body: some View {
        
        // Pop Up BG
        ZStack{
            Rectangle()
                .frame(width: 361, height: 533)
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(radius: 20)
            
            // Pop Up
            VStack{
                Image(systemName: "hourglass")
                    .font(.system(size: 50))
                Text("Waiting For Game to Start")
                    .font(.system(size: 20))
                    .padding(.top, 20)

            }
        }
    }
}
struct waiting_room_popup_Previews: PreviewProvider {
    static var previews: some View {
        waiting_room_popup()
    }
}
