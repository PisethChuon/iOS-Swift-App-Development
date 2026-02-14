//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Button {
                print("Tapped!")
            } label: {
                Label("Send", systemImage: "paperplane.fill")
            }
            
            Button {
                print("Press")
            } label: {
                Label("Heart", systemImage: "heart.fill")
            }
        }
        
    
    }
}

#Preview {
    ContentView()
}
