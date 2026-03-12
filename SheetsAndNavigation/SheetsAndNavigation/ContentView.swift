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
                NavigationLink{
                    DetailView()
                } label: {
                    HStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailView: View {
    
    var body: some View {
        VStack {
            Text("Detail")
                .navigationTitle("Detail")
        }
    }
}


#Preview {
    ContentView()
}
