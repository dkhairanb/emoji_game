//
//  ContentView.swift
//  camera
//
//  Created by Dhil Khairan Badjiser on 22/03/23.
//

import SwiftUI

struct ContentView: View {
    let emoji : [String]

    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false

    var body: some View {

            VStack{
                Spacer()
                
                
                //tagline
                Text("Pose Like Your Emoji🥳")
                    .font(.custom("SFPro", size: 20))
                Spacer()
                
                //Emoji list
                HStack{
                    ForEach(1..<emoji.count+1){number in
                        Text("\(emoji[number-1])")
                            .font(.system(size: 46))
                            .padding(22)
                        Spacer()
                    }
//                    Text("🥷")
//                        .font(.system(size: 46))
//                        .padding(22)
//                    Spacer()
//                    Text("🌏")
//                        .font(.system(size: 46))
//                        .padding(22)
//
//                    Spacer()
//                    Text("🥴")
//                        .font(.system(size: 46))
//                        .padding(22)
//
//                    Spacer()
//                    Text("🤨")
//                        .font(.system(size: 46))
//                        .padding(22)

                }
                Spacer()
                
                //taken picture
                if capturedImage != nil{
                    Image(uiImage: capturedImage!)
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                        .cornerRadius(10)
                        .padding(10)
                } else {
                    Color(UIColor.systemBackground)
                }
                
                
                    
                    //camera button

                if capturedImage == nil {
                    Button(action: {
                                isCustomCameraViewPresented.toggle()
                            }, label: {
                                Image(systemName: "camera.fill")
                                    .font(.largeTitle)
                                    .padding()
                                    .background(Color("primaryColor"))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            })
                            .padding(.bottom)
                        .sheet(isPresented: $isCustomCameraViewPresented, content:{ CustomCameraView(capturedImage: $capturedImage)})
                }
                    
                    
                    //save image button
                else {
                    Button(action: {
                                UIImageWriteToSavedPhotosAlbum(capturedImage!, nil, nil, nil)
                            }, label: {
                                Text("Save Image")
                                    .padding(8)
                                    .frame(width: 287, height: 50)
                                    .font(.system(size: 17))
                                    .background(Color("blue"))
                                    .foregroundColor(Color.white)
                                    .buttonStyle(.borderedProminent)
                                    .cornerRadius(10)
                                    .padding(10)
                                    
                                    
                        })
                }
                    
                

            }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emoji: [])
    }
}
