//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea() // Clean background
            
            GeometryReader { geometry in
                VStack {
                    // The White Box
                    VStack {
                        Text("Top")
                        Spacer()
                        Text("Bottom")
                    }
                    .padding()
                    .frame(width: geometry.size.width * 0.8, height: 300)
                    .background(Color.white)
                    .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Centers the box
            }
        }
    }
}

#Preview {
    ContentView()
}
