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
                    ZStack {
                        Rectangle()
                            .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Image("emojique_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                    }
                    
                    // button

                    Button {
//                        print("test")
                        isOverlay.toggle()
                    } label: {
                        Text("Start")
                            .font(.title)
                            .font(.system(size: 14))
                            .frame(width: 350, height: 50)
                    }
                    .background(Color("primaryColor"))
                    .foregroundColor(Color(.white))
                    .cornerRadius(8)
                    .padding(.top, 30)
                   
                    //
                }
                .padding()
            }
            .overlay {
                if isOverlay {
                    lobby_popup()
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


