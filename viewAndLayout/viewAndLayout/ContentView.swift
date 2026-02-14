//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLiked = false
    let name: String = "Piseth CHUON"

    var body: some View {
        
        VStack(spacing: 16) {
            Image(systemName: "person.circle.fill")
                .font(.title)
            Text(name)
            
            HStack(spacing: 24) {
                Button {
                    withAnimation {
                        isLiked.toggle()
                    }
                } label: {
                    Image(systemName: "heart")
                        .symbolVariant(isLiked ? .fill : .none)
                }
                Image(systemName: "message")
                    .foregroundStyle(.gray)
                Image(systemName: "square.and.arrow.up")
                    .foregroundStyle(.gray)
            }
            .font(.title)
        }
    }
}

#Preview {
    ContentView()
}
