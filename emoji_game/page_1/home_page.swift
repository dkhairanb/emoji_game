//
//  home_page.swift
//  emoji_game
//
//  Created by Aysha Hafizhatul on 25/03/23.
//

import SwiftUI

struct home_page: View {
    
    @State var isOverlay: Bool = false
    @State var isOverlay2: Bool = false
    
    var body: some View {
        
        // background apps
        NavigationView {
            ZStack{
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                
                // logo
                VStack {
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                    
                    // button

                    Button {
//                        print("test")
                        isOverlay.toggle()
                    } label: {
                        Text("Create Room")
                            .font(.system(size: 17))
                            .frame(width: 350, height: 50)
                    }
                    .background(.white)
                    .foregroundColor(Color("blue"))
                    .cornerRadius(8)
                    .padding(.top, 30)
                   
                    
                    Button {
                        print("join")
                        isOverlay2.toggle()
                    } label: {
                        Text("Join Room")
                            .font(.system(size: 17))
                            .frame(width: 350, height: 50)
                    }
                    .background(.white)
                    .foregroundColor(Color("blue"))
                    .cornerRadius(8)
                    
                    // privacy policy
    //                Text("Lorem ipsum dot asda qwejqweiasd")
//                        .font(.system(size: 12))
//                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
//                        .foregroundColor(.white)
                    
                }
                .padding()
            }
            .overlay {
                if isOverlay {
                    Pop_Up()
                }
            }
            
            .overlay {
                if isOverlay2 {
                    Pop_Up_2()
                }
            }
        }
    }
}
    struct home_page_Previews: PreviewProvider {
        static var previews: some View {
            home_page()
        }
    }


