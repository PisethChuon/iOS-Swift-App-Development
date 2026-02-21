//
//  ContentView.swift
//  Tap Game
//
//  Created by chuonpiseth on 21/2/26.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let possiblePics = ["apple", "dog", "egg"]
    @State private var currentPicIndex = 0
    
    var body: some View {
        
        VStack {
            Menu("Difficalty") {
                Button("Easy", action: {
                    
                })
                Button("Medium", action: {
                    
                })
                Button("Hard", action: {
                    
                })
            }
                    
                
                
                    
                
            
            Image(possiblePics[currentPicIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
        }
        .onReceive(timer, perform:  { _ in
//            changePic()
        })
        
    }
    func changePic() {
        if currentPicIndex == possiblePics.count - 1 {
            currentPicIndex = 0
        } else {
            currentPicIndex += 1
        }
    }
}

#Preview {
    ContentView()
}
