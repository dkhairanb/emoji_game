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

struct ContentView: View {
    
    @State var selectedEmoji: Emoji?

    @State var displayEmojiPicker: Bool = false
    
    @State private var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let data : [Int] = Array(1...4)
    private let name : [String] = ["You", "Player 1", "Player 2", "Player 3"]
    private let answer : [String] = ["😤", "😧", "🥶", "🤥"]

    @State var topic : [String] = ["Albert Einstein", "UFO", "Apple Academy", "Animation"]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 110))
    ]
    
    var body: some View {
        VStack {
            Text("Create Your Own Emoji About This Topic🥳").padding()
            
            Text(topic[0]).foregroundColor(.white).font(.system(size: 38, design: .serif)).multilineTextAlignment(.center).bold().fixedSize(horizontal: false, vertical: true).scaledToFit().padding().frame(width: 286, height: 168).background(Color("primaryColor")).cornerRadius(8).shadow( color: Color("shadowColor"), radius: 8)
            
            countdownTimer(timeRemaining: timeRemaining).padding(.horizontal, 40).padding(.vertical, 5).font(.system(size: 30)).bold().background(Color("boxColor")).cornerRadius(10).padding()
            
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 10){
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            VStack{
                                number-1 == 0 ?
                                showEmoji(timeRemaining: timeRemaining, emoji: "\(selectedEmoji?.value ?? "")").padding().frame(width: 110, height: 110).background(Rectangle().fill(Color("secondaryColor")).cornerRadius(8)) :
                                showEmoji(timeRemaining: timeRemaining, emoji: "\(answer[number-1])").padding().frame(width: 110, height: 110).background(Rectangle().fill(Color("secondaryColor")).cornerRadius(8))
                                Text("\(name[number-1])")
                            }
                            
                        }
                    }
                }
            }.padding(.horizontal, 40).padding(.top, 20)
            
            if(timeRemaining == 0){
                Button{
                    timeRemaining = 10
                    self.topic.shuffle()
                } label: {
                    Text("Next").frame(width: 350, height: 50).bold()
                }.background(Color("secondaryColor")).foregroundColor(.white).cornerRadius(8)
            } else {
                Button {
                    displayEmojiPicker = true
                } label: {
                    Text("Select emoji")
                }
            }
            
            Spacer()
        }.onReceive(timer) { time in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .sheet(isPresented: $displayEmojiPicker) {
            NavigationView {
                EmojiPickerView(selectedEmoji: $selectedEmoji, selectedColor: .orange)
                    .navigationTitle("Emojis")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
