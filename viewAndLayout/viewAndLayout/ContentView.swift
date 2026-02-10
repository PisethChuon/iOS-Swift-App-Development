//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack (alignment: .top){
            Text("Small")
            Text("Mediume ")
                .font(.title2)
            Text("Big")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
