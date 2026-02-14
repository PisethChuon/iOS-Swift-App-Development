//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isLiked = false

    var body: some View {
        Image(systemName: isLiked ? "heart.fill" : "heart")
            .foregroundColor(isLiked ? .red : .gray)
            .font(.system(size: 100))
            .onTapGesture {
                withAnimation {
                    isLiked.toggle()
                }
            }
    }
}

#Preview {
    ContentView()
}
