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
            GeometryReader { geometry in
                VStack {
                    Color.white
                        .frame(width: geometry.size.width * 0.8, height: 300)
                }
                .frame(maxWidth: .infinity) // Centers the content
            }
            
            
                
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

#Preview {
    ContentView()
}
