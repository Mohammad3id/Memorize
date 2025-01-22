//
//  ContentView.swift
//  Memorize
//
//  Created by Mohammad Eid on 21/01/2025.
//

import SwiftUI

enum CardTheme {
    case halloween, nature, animals
    
    var color: Color {
        switch self {
        case .halloween: .orange
        case .nature: .green
        case .animals: .brown
        }
    }
    
    var emojis: [String] {
        switch self {
        case .halloween: ["🎃", "👻", "🕷️", "😈", "💀", "🧙", "🙀", "👹", "😱", "☠️"]
        case .nature: ["🌲", "🌻", "🌊", "☀️", "🌸", "🍂", "⛰️", "🌵", "🍃", "🌈"]
        case .animals: ["🐶", "🐱", "🦁", "🐵", "🐸", "🦉", "🐢", "🐰", "🦊", "🐼"]
        }
    }
    
    var symbol: String {
        switch self {
        case .halloween: "ant"
        case .nature: "leaf"
        case .animals: "pawprint"
        }
    }
    
    var label: String {
        switch self {
        case .halloween: "Halloween"
        case .nature: "Nature"
        case .animals: "Animals"
        }
    }
}

struct ContentView: View {
    @State var cardEmojis = [String]()
    @State var selectedTheme = CardTheme.halloween
    
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
        .onAppear {
            cardEmojis = generatePairEmojis(from: selectedTheme)
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(cardEmojis.indices, id: \.self) { i in
                CardView(content: cardEmojis[i])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(selectedTheme.color)
    }
    
    var themeButtons: some View {
        HStack {
            themeButton(.halloween)
            Spacer()
            themeButton(.nature)
            Spacer()
            themeButton(.animals)
        }
    }
    
    func themeButton(_ theme: CardTheme) -> some View {
        Button {
            selectedTheme = theme
            cardEmojis = generatePairEmojis(from: theme)
        } label: {
            VStack {
                Image(systemName: theme.symbol)
                Text(theme.label)
            }
        }
    }
    
    func generatePairEmojis(from theme: CardTheme) -> [String] {
        let pairEmojis = theme.emojis.shuffled().dropFirst((1...3).randomElement()! * 2)
        return (pairEmojis + pairEmojis).shuffled()
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
