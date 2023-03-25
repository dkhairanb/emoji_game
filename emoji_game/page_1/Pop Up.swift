//
//  Pop Up.swift
//  emoji_game
//
//  Created by Aysha Hafizhatul on 25/03/23.
//

import SwiftUI

func RandomCode() -> NSString{
    let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let randomString : NSMutableString = NSMutableString(capacity: 5)
    
    for _ in 1...5 {
        let length = UInt32 (letters.length)
        let rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.character(at: Int(rand)))
    }
    return randomString
};

struct Pop_Up: View {
    @State public var participantCount : Int = 0
    @State private var textFieldContent = ""
    
    let code = RandomCode()
    
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
                Text("Your Invite Code:")
                    .font(.system(size: 16))
                    .foregroundColor(Color.black)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("gray"))
                        .frame(width: 258, height: 102)
                        .cornerRadius(8)
                    Text("\(code)")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundColor(Color("blue"))
                }
//                Rectangle()
//                    .foregroundColor(Color("gray"))
//                    .frame(width: 258, height: 102)
//                    .cornerRadius(8)
                
                Text("\(participantCount) Joined")
                
                Text("Please Enter Your Name")
                    .font(.system(size: 16))
                    .foregroundColor(Color.black)
                    .padding(.top, 100)
                
                TextField("Enter Your Name", text: $textFieldContent)
                    .font(.system(size: 14))
                    .foregroundColor(Color("abutua"))
                    .padding(5)
                    .background(Color("gray"))
                    .textContentType(.givenName)
                
                //                   .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12))
                    .frame(width: 191, height: 33)
                    .cornerRadius(8)
                
                // button
                Button {
                    
                } label: {
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
        
//        .navigationBarBackButtonHidden(true)
    }
}

struct Pop_Up_Previews: PreviewProvider {
    static var previews: some View {
        Pop_Up()
    }
}
