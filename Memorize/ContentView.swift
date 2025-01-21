//
//  ContentView.swift
//  Memorize
//
//  Created by Mohammad Eid on 21/01/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈"]
    
    var body: some View {
        HStack {
            ForEach(0..<emojis.count, id: \.self) { i in
                CardView(content: emojis[i])
            }
        }
        .foregroundStyle(.blue)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let rectangle = RoundedRectangle(cornerRadius: 12, style: .circular)
            if isFaceUp {
                rectangle.foregroundStyle(.white)
                rectangle.stroke(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                rectangle
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
