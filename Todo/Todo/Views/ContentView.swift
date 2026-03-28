//
//  ContentView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI


struct ContentView: View {
    
    @State private var viewModel = TaskViewModel()
    @State private var selectedTasks = Set<Task.ID>()
    
    var body: some View {
        NavigationStack {
            List(viewModel.tasks, selection: $selectedTasks) { task in
                TaskView(task: task)
                    .tag(task)
            }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete", role: .destructive) {
                            viewModel.deleteTasks(ids: selectedTasks)
                            selectedTasks.removeAll()
                        }
                        .disabled(selectedTasks.isEmpty)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            AddTodoTask(onAdd: { title, priority in
                                viewModel.addTask(title: title, priority: priority)
                            })
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
