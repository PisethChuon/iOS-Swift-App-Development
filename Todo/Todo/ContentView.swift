//
//  ContentView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Todo")
            
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .navigationTitle("Tasks")
        }
        
    }
}

#Preview {
    ContentView()
}
