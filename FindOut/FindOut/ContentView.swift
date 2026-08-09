//
//  ContentView.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI

let isAdmin: Bool = true

struct ContentView: View {
    var body: some View {
        VStack {
            ProfileCard(name: "Piseth CHUON") {
                Text("Software Engineer")
                
                if isAdmin {
                    Text("Administrator")
                        .font(.caption)
                }
                
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
