//
//  ContentView.swift
//  Task
//
//  Created by chuonpiseth on 25/4/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // Connection to CoreData database; use to read/write data
    @Environment(\.managedObjectContext) private var viewContext
    // Automatic load data from database, when database change UI update automacicly
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.createdAt, ascending: true)],
        animation: .default) // sorted by 'createdAt'
    private var tasks: FetchedResults<TaskItem>
    
    var body: some View {
        
        Button("Add Task") {
            let newTask = TaskItem(context: viewContext)
            
            newTask.title = "Task \(Int.random(in: 1...100))"
            newTask.createdAt = Date()
            newTask.isDone = false
            
            do {
                try viewContext.save()
                print("Save!")
            } catch {
                print("Error saving")
            }
        }
        
        List {
            ForEach(tasks) { task in
                Text("\(task.title ?? "No title") — \(task.isDone ? "Done" : "Not done")")
                Spacer()
                Button("Update") {
//                    task.title = "Updated \(Int.random(in: 1...100))"
                    task.isDone = true
                    do {
                        try viewContext.save()
                    } catch {
                        print("Update failed")
                    }
                }
            }
            .onDelete(perform: deleteTasks) // Tell core data "delete this object"
        }
        
    }
    
    private func deleteTasks(offsets: IndexSet) {
        offsets.map { tasks[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()  // Save the context again
        } catch {
            print("Error deleting")
        }
    }
    
    
}



#Preview {
    ContentView()
}
