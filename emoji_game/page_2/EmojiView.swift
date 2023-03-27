//
//  ContentView.swift
//  emoji_game
//
//  Created by Dhil Khairan Badjiser on 21/03/23.
//

import SwiftUI
import EmojiPicker

func countdownTimer(timeRemaining : Int) -> Text{
    if timeRemaining < 10 && timeRemaining != 0 {
        return Text("00:0\(timeRemaining)")
    } else if (timeRemaining == 0) {
        return Text("Times Up!").foregroundColor(Color(.red))
    } else {
        return Text("00:\(timeRemaining)")
    }
};

func showEmoji(timeRemaining : Int, emoji: String) -> Text{
    if timeRemaining == 0 {
        return Text(emoji).font(.system(size: 75))
    } else {
        return Text("Waiting...").foregroundColor(Color(.white))
    }
}

struct EmojiView: View {
    
    @State var selectedEmoji: Emoji?

    @State var displayEmojiPicker: Bool = false
    
    @State private var timeRemaining = 10
    @State private var timeRemainingTopic = 59
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let name : [String]
    @State var answer = [String]()
    @State private var index: Int = 0;
    @State private var indexSpeak: Int = 0;
    
    let topic : [String] = ["Albert Einstein", "UFO", "Apple Academy", "Animation","Indonesia"]
    @State var topics = ""
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 110))
    ]
    
    var body: some View {
        ZStack{
            Image("BackgroundGame")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            
            VStack {
                if(index < name.count) {
                    Text("Emojis: Your Secret Weapon for Expressive Communication!🥳").foregroundColor(Color("shadowColor")).padding(.top, 90)
                } else {
                    Text("Tell Us About Your Emoji😝").foregroundColor(Color("shadowColor")).padding(.top, 90)
                }


                Text(topics).onAppear{
                    topics = topic.shuffled().first ?? ""
                }.padding(.top, 40).foregroundColor(Color("primaryColor")).font(.system(size: 38)).multilineTextAlignment(.center).bold().fixedSize(horizontal: false, vertical: true).scaledToFit().padding()

                if(index > name.count-1){
                    if(indexSpeak == 0){
                        countdownTimer(timeRemaining: timeRemaining).padding(.horizontal, 40).padding(.vertical, 5).font(.system(size: 30)).bold().background(Color(.white)).cornerRadius(30).shadow(color: Color("shadow"), radius: 10).padding(.top, 40)
                    } else {
                        countdownTimer(timeRemaining: timeRemainingTopic).padding(.horizontal, 40).padding(.vertical, 5).font(.system(size: 30)).bold().background(Color(.white)).cornerRadius(30).shadow(color: Color("shadow"), radius: 10).padding(.top, 40)
                    }
                    
                    ScrollView{
                        LazyVGrid(columns: adaptiveColumns, spacing: 10){
                            ForEach(1..<name.count+1) { number in
                                ZStack {
                                    VStack{
                                        if(timeRemaining == 0 && number == indexSpeak) {
                                            showEmoji(timeRemaining: timeRemaining, emoji: "\(answer[number-1])").padding().frame(width: 110, height: 110).background(Rectangle().fill(Color("shadow")).cornerRadius(8))
                                        } else {
                                            showEmoji(timeRemaining: timeRemaining, emoji: "\(answer[number-1])").padding().frame(width: 110, height: 110).background(Rectangle().fill(Color("secondaryColor")).cornerRadius(8))
                                        }
                                        Text("\(name[number-1])")
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal, 40).padding(.top, 60)
                } else {
                    Text("\(name[index])'s Turn").foregroundColor(Color("primaryColor")).padding()
                }
                
                Spacer()
                
                if(index < name.count) {
                    Button {
                        displayEmojiPicker = true
                    } label: {
                        Text("Select emoji").padding(.bottom, 20)
                    }
                } else if (timeRemaining == 0 && indexSpeak < name.count){
                    Button {
                        timeRemainingTopic = 59
                        indexSpeak = indexSpeak + 1
                    } label: {
                        Text("Next").frame(width: 350, height: 50).bold().background(Color("primaryColor")).foregroundColor(.white).cornerRadius(8).padding(.bottom, 80)
                    }
                }
                
                if(index < name.count) {
                    Button{
                        answer.append(selectedEmoji?.value ?? "")
                        index < name.count ? index = index + 1 : ()
                        index == name.count ? timeRemaining = 5 : ()
                        print(answer)
                    } label: {
                        Text("Next").frame(width: 350, height: 50).bold()
                    }.background(Color("secondaryColor")).foregroundColor(.white).cornerRadius(8).padding(.bottom, 80)
                } else {
                    if(indexSpeak >= name.count){
                        Button{
                            index = index + 1
                        } label: {
                            NavigationLink(destination: ContentView(emoji : answer))
                            {
                                Text("Next").frame(width: 350, height: 50).bold()
                            }.background(Color("primaryColor")).foregroundColor(.white).cornerRadius(8).padding(.bottom, 80)
                        }
                    }
                }
                
            }.onReceive(timer) { time in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .sheet(isPresented: $displayEmojiPicker) {
                NavigationView {
                    EmojiPickerView(selectedEmoji: $selectedEmoji, selectedColor: .gray)
                        .navigationTitle("Emojis")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .onReceive(timer) { time in
                if timeRemainingTopic > 0 {
                    timeRemainingTopic -= 1
                }
            }
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(name: [])
    }
}
