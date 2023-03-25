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
                        Text("Play")
                            .font(.title)
                            .font(.system(size: 17))
                            .frame(width: 350, height: 50)
                    }
                    .background(.white)
                    .foregroundColor(Color("blue"))
                    .cornerRadius(8)
                    .padding(.top, 30)
                   
                    
                }
                .padding()
            }
            .overlay {
                if isOverlay {
                    create_room_popup()
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


