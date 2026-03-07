//
//  ContentView.swift
//  ScrambledWords
//
//  Created by chuonpiseth on 21/2/26.
//

import SwiftUI

struct ContentView: View {
    @State var letters: [Letter] = [
        Letter(id: 0, text: "A"),
        Letter(id: 1, text: "O"),
        Letter(id: 2, text: "N"),
        Letter(id: 3, text: "E"),
        Letter(id: 4, text: "G"),
        Letter(id: 5, text: "R"),
    ]
    @State var guessedLetters: [Letter] = []
    let correctWord = "ORANGE"
    
    @State private var showAlert:Bool = false
    @State private var alertMessage: String = ""
    
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
                            ForEach(guessedLetters) { guessedLetter in
                                VStack {
                                    LetterView(letter: guessedLetter)
                                        .onTapGesture {
                                            if let index = letters.firstIndex(where: {$0.id == guessedLetter.id}){
                                                
                                                // Restore the letter
                                                letters[index].text = guessedLetter.text
                                                
                                                // Remove from guessedLetters
                                                if let guessedIndex = guessedLetters.firstIndex(where: { $0.id == guessedLetter.id }) {
                                                            guessedLetters.remove(at: guessedIndex)
                                                        }
                                            }
                                        }
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 20, height: 2)
                                }
                            }
                        }
                        .padding(.bottom, 20)
                        .frame(width: proxy.size.width * 0.8, height: proxy.size.width * 0.9)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.border, lineWidth: 2)
                        }
                        Text("Score: 0")
                            .font(.system(size: 24))
                            .foregroundStyle(Color.white)
                            .padding(.top)
                        HStack {
                            ForEach(Array(letters.enumerated()), id: \.1) { index, letter in
                                LetterView(letter: letter)
                                    .onTapGesture {
                                        if !letter.text.isEmpty {
                                            guessedLetters.append(letter)
                                            letters[index].text = ""
                                            
                                            if guessedLetters.count == correctWord.count {
                                                let guess = guessedLetters.map {$0.text}.joined()
                                                if guess == correctWord {
                                                    alertMessage = "Correct"
                                                } else {
                                                    alertMessage = "Not quite, try again!"
                                                }
                                                showAlert = true
                                            }
                                        }
                                    }
                            }
                        }
                    }
                }
            }
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    // Optional: reset guessedLetters here if wrong
                    if alertMessage.contains("Wrong") {
                        // put letters back if you want
                        for letter in guessedLetters {
                            if let index = letters.firstIndex(where: { $0.id == letter.id }) {
                                letters[index].text = letter.text
                            }
                        }
                        guessedLetters.removeAll()
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
    let letter: Letter
    var body: some View {
        Text(letter.text)
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
