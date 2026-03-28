//
//  ContentView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI


struct ContentView: View {
    
    @State private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.tasks) { task in
                TaskView(task: task)
            }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            NavigationLink("") {
                                
                            }
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
