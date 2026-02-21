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
                    VStack {
                        Spacer()
                        Image("orange")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
                        HStack {
                            VStack {
                                LetterView(character: "")
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 20, height: 2)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: proxy.size.width * 0.8, height: proxy.size.width * 0.9)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 2)
                    }
                    Text("Score: 0")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 24))
                        .padding(.top)
                    HStack {
                        LetterView(character: "O")
                        LetterView(character: "R")
                        LetterView(character: "A")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LetterView: View {
    let character: String
    var body: some View {
        Text(character)
            .font(.system(size: 30, weight: .semibold))
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
