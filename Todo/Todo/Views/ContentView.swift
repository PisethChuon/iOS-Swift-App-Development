//
//  ContentView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            Text("Todo")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    }
                }
            
                .navigationTitle("Tasks")
                .sheet(isPresented: $showSheet) {
                    CreateTaskSheetView()
                }
        }
    }
}

#Preview {
    ContentView()
}
