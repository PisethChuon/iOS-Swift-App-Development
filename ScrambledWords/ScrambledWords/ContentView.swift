//
//  ContentView.swift
//  ScrambledWords
//
//  Created by chuonpiseth on 21/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Image("orange")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .frame(width: proxy.size.width * 0.8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.border, lineWidth: 2)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
