//
//  ContentView.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI

struct RecipeSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(
        title: String,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            content
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            RecipeSection(title: "Ingredients") {
                Text("1 cup of coffee")
                Text("1 cup of coffee")
                Text("1 cup of coffee")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
