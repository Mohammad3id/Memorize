//
//  ContentView.swift
//  Memorize
//
//  Created by Mohammad Eid on 21/01/2025.
//

import SwiftUI


struct ContentView: View {
    let halloweenEmojis = ["🎃", "👻", "🕷️", "😈", "💀", "🧙", "🙀", "👹", "😱", "☠️"]
    let natureEmojis = ["🌲", "🌻", "🌊", "☀️", "🌸", "🍂", "⛰️", "🌵", "🍃", "🌈"]
    let animalEmojis = ["🐶", "🐱", "🦁", "🐵", "🐸", "🦉", "🐢", "🐰", "🦊", "🐼"]
    
    let halloweenColor = Color.orange
    let natureColor = Color.green
    let animalColor = Color.brown
    
    @State var selectedThemeEmojis: [String]
    @State var selectedThemeColor: Color
    
    init() {
        let emojis = halloweenEmojis.shuffled().dropFirst((1...3).randomElement()! * 2)
        selectedThemeEmojis = (emojis + emojis).shuffled()
        selectedThemeColor = halloweenColor
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            Spacer()
            cards
            Spacer()
            themeButtons
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(selectedThemeEmojis.indices, id: \.self) { i in
                CardView(content: selectedThemeEmojis[i])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(selectedThemeColor)
    }
    
    var themeButtons: some View {
        HStack {
            themeButton(for: "Halloween", symbol: "ant", emojis: halloweenEmojis, color: halloweenColor)
            Spacer()
            themeButton(for: "Nature", symbol: "leaf", emojis: natureEmojis, color: natureColor)
            Spacer()
            themeButton(for: "Animals", symbol: "pawprint", emojis: animalEmojis, color: animalColor)
        }
    }
    
    func themeButton(for label: String, symbol: String, emojis: [String], color: Color) -> some View {
        Button {
            let emojis = emojis.shuffled().dropFirst((1...3).randomElement()! * 2)
            selectedThemeEmojis = (emojis + emojis).shuffled()
            selectedThemeColor = color
        } label: {
            VStack {
                Image(systemName: symbol)
                Text(label)
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let rectangle = RoundedRectangle(cornerRadius: 12, style: .circular)
            
            
            rectangle.foregroundStyle(.white)
            rectangle.stroke(lineWidth: 2)
            Text(content).font(.largeTitle)
            
            rectangle.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
