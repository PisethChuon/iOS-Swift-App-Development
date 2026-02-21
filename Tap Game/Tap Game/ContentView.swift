//
//  ContentView.swift
//  Tap Game
//
//  Created by chuonpiseth on 21/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        var possiblePics = ["apple", "dog", "egg"]
        
        VStack {
            Image(possiblePics[1])
                .resizable()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
