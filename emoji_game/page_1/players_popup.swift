//
//  Pop Up.swift
//  emoji_game
//
//  Created by Aysha Hafizhatul on 25/03/23.
//

import SwiftUI

struct players_popup: View {
    
    
    @State private var playerNames = [String](repeating: "", count: 4)
    let lobbyPopup = lobby_popup()
    let player: Int
    
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
                
                
                ForEach(0..<player, id: \.self) { index in
                                    TextField("Player \(index + 1)", text: $playerNames[index])
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("abutua"))
                                        .padding(5)
                                        .background(Color("gray"))
                                        .textContentType(.givenName)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 191, height: 33)
                                        .cornerRadius(8)
                                }
                
                // play button
                Button {
                    print(playerNames)
                } label: {
                    NavigationLink(destination: EmojiView())
                    {
                        HStack{
                            Image(systemName: "play.fill")
                            Text("Play")
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
}

struct players_popup_Previews: PreviewProvider {
    static var previews: some View {
        players_popup(player: 2)
    }
}
