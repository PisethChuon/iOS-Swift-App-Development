//
//  ContentView.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        VStack {
            ProfileCard(name: "Piseth CHUON") {
                Text("Hello World")
                Text("Software Engineer")
                Button("View Details") {
                    print("view details button tapped")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
