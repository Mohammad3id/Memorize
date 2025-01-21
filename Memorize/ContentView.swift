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
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.orange)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12, style: .circular)
            }
        }
    }
}

#Preview {
    ContentView()
}
