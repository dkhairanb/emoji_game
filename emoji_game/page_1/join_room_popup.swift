//
//  Pop Up 2.swift
//  emoji_game
//
//  Created by Aysha Hafizhatul on 25/03/23.
//

import SwiftUI

struct join_room_popup: View {
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
                Text("Input Name:")
                    .font(.system(size: 16))
                    .foregroundColor(Color.black)
                Rectangle()
                    .foregroundColor(Color("gray"))
                    .frame(width: 258, height: 102)
                    .cornerRadius(8)
                
                Text("Input Code:")
                    .font(.system(size: 16))
                    .foregroundColor(Color.black)
                    .padding(.top, 48)
                Rectangle()
                    .foregroundColor(Color("gray"))
                    .frame(width: 258, height: 102)
                    .cornerRadius(8)
                
                // button
                Button {
                    print(RandomCode())
                } label: {
                    HStack{
                        Text("Join")
                            .font(.system(size: 17))
                        
                    }.padding()
                        .frame(width: 255, height: 50)
                        .background(Color("blue"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top, 30)
                        .buttonStyle(.bordered)
                }
            }
        }
    }
}

struct join_room_popup_Previews: PreviewProvider {
    static var previews: some View {
        join_room_popup()
    }
}
