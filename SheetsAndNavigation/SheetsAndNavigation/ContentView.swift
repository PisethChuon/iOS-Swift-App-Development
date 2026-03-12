//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Screen")
                
                NavigationLink("Go to Detail") {
                    DetailView()
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailView: View {
    
    var body: some View {
        VStack {
            Text("Detail Screen")
                .navigationTitle("Detail")
        }
    }
}


#Preview {
    ContentView()
}
