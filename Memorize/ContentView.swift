//
//  ContentView.swift
//  Memorize
//
//  Created by Mohammad Eid on 21/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.blue)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let rectangle = RoundedRectangle(cornerRadius: 12, style: .circular)
            if isFaceUp {
                rectangle.foregroundStyle(.white)
                rectangle.stroke(lineWidth: 2)
                Text("👻").font(.largeTitle)
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
