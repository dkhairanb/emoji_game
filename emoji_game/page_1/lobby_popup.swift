//
//  Pop Up.swift
//  emoji_game
//
//  Created by Aysha Hafizhatul on 25/03/23.
//

import SwiftUI

struct lobby_popup: View {
    @State public var participantCount : Int = 2
    @State private var textFieldContent = ""
    @State public var player1Name = ""
    @State public var player2Name = ""
    @State public var player3Name = ""
    @State public var player4Name = ""
    

    
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
                Text("Number of Players")
                    .font(.system(size: 16))
                    .foregroundColor(Color.black)
                
                HStack {
                    
                    //minus button
                    Button{
                        if participantCount > 2{
                            participantCount -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                        
                            .frame(width: 50, height: 50)
                            .background(Color("blue"))
                            .foregroundColor(Color.white)
                            .clipShape(Circle())
                            .padding(20)
                    }

                    //player number
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("gray"))
                            .frame(width: 115, height: 102)
                            .cornerRadius(8)
                        Text("\(participantCount)")
                            .font(.system(size: 55, weight: .bold))
                            .foregroundColor(Color("blue"))
                    }
                    
                    //add button
                    Button{
                        if participantCount < 4{
                            participantCount += 1
                        }
                    } label: {
                        Image(systemName: "plus")
                        
                            .frame(width: 50, height: 50)
                            .background(Color("blue"))
                            .foregroundColor(Color.white)
                            .clipShape(Circle())
                            .padding(20)
                    }
                }

                
//                Text("Please Enter Your Name")
//                    .font(.system(size: 16))
//                    .foregroundColor(Color.black)
//                    .padding(.top, 100)
//
//                TextField("Enter Your Name", text: $textFieldContent)
//                    .font(.system(size: 14))
//                    .foregroundColor(Color("abutua"))
//                    .padding(5)
//                    .background(Color("gray"))
//                    .textContentType(.givenName)
//
//
//                    .multilineTextAlignment(.center)
//                    .font(.system(size: 12))
//                    .frame(width: 191, height: 33)
//                    .cornerRadius(8)
                
                // play button
                Button {
                    
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

struct Pop_Up_Previews: PreviewProvider {
    static var previews: some View {
        lobby_popup()
    }
}
