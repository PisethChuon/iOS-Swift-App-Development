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
                Text("Person")
            HStack {
                Image(systemName: "person.fill")
                Text("Picture")
            }
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    ContentView()
}
