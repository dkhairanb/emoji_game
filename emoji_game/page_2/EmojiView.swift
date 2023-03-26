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
    
    let topic : [String] = ["Albert Einstein", "UFO", "Apple Academy", "Animation"]
    @State var topics = ""
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 110))
    ]
    
    var body: some View {
        VStack {
            if(index < name.count) {
                Spacer()
                Text("Create Your Own Emoji About This Topic🥳").padding()
            } else {
                Text("Tell Us About Your Emoji😝").padding()
            }
            
            
            
            Text(topics).onAppear{
                topics = topic.shuffled().first ?? ""
            }.foregroundColor(.white).font(.system(size: 38, design: .serif)).multilineTextAlignment(.center).bold().fixedSize(horizontal: false, vertical: true).scaledToFit().padding().frame(width: 286, height: 168).background(Color("primaryColor")).cornerRadius(8).shadow( color: Color("shadowColor"), radius: 8)
            
            if(index > name.count-1){
                if(indexSpeak == 0){
                    countdownTimer(timeRemaining: timeRemaining).padding(.horizontal, 40).padding(.vertical, 5).font(.system(size: 30)).bold().background(Color("boxColor")).cornerRadius(10).padding()
                } else {
                    countdownTimer(timeRemaining: timeRemainingTopic).padding(.horizontal, 40).padding(.vertical, 5).font(.system(size: 30)).bold().background(Color("boxColor")).cornerRadius(10).padding()
                }
                
                ScrollView{
                    LazyVGrid(columns: adaptiveColumns, spacing: 10){
                        ForEach(1..<name.count+1) { number in
                            ZStack {
                                VStack{
                                    if(timeRemaining == 0 && number == indexSpeak) {
                                        showEmoji(timeRemaining: timeRemaining, emoji: "\(answer[number-1])").padding().frame(width: 110, height: 110).background(Rectangle().fill(Color("primaryColor")).cornerRadius(8))
                                    } else {
                                        showEmoji(timeRemaining: timeRemaining, emoji: "\(answer[number-1])").padding().frame(width: 110, height: 110).background(Rectangle().fill(Color("secondaryColor")).cornerRadius(8))
                                    }
                                    Text("\(name[number-1])")
                                }
                            }
                        }
                    }
                }.padding(.horizontal, 40).padding(.top, 20)
            } else {
                Text("\(name[index])'s Turn").padding()
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
                    Text("Pass").padding(.bottom, 20)
                }
            }
            
            if(index < name.count) {
                Button{
                    answer.append(selectedEmoji?.value ?? "")
                    index < name.count ? index = index + 1 : ()
                    index == name.count ? timeRemaining = 5 : ()
                    print(answer)
                } label: {
                    Text("Pass").frame(width: 350, height: 50).bold()
                }.background(Color("secondaryColor")).foregroundColor(.white).cornerRadius(8)
            } else {
                if(indexSpeak >= name.count){
                    Button{
                        index = index + 1
                    } label: {
                        NavigationLink(destination: ContentView(emoji : answer))
                        {
                            Text("Next").frame(width: 350, height: 50).bold()
                        }.background(Color("secondaryColor")).foregroundColor(.white).cornerRadius(8)
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

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(name: [])
    }
}
