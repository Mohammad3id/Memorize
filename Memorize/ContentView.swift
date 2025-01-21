//
//  ContentView.swift
//  Memorize
//
//  Created by Mohammad Eid on 21/01/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            Spacer()
            cardControls
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<cardCount, id: \.self) { i in
                CardView(content: emojis[i])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardControls: some View {
        HStack {
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
            Spacer()
            cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
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
