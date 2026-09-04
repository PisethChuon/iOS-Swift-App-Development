//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by chuonpiseth on 4/9/26.
//

import SwiftUI

struct ContentView: View {
    @State var name: [String] = ["Elisha", "Andre", "Jasmin", "Po-Chum"]
    
    var body: some View {
        VStack {
            List {
                ForEach(name, id: \.description) { name in
                    Text(name)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
