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
            Text("Hello")
            Text("Welcome")
            
            HStack {
                Image(systemName: "person.fill")
                Text("Person")
            }
            
            ZStack {
                Color.gray
            }
            
        }
    }
}

#Preview {
    ContentView()
}
