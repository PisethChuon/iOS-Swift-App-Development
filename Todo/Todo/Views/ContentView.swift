//
//  ContentView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI

// Model 'Task'
struct Task: Identifiable {
    let id = UUID()
    var title: String
}

struct ContentView: View {
    
    @State private var showSheet = false
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationStack {
            List (selection: $multiSelection) {
                TaskView()
            }
            Text("\(multiSelection.count) selection")
            
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
