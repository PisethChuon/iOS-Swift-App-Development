//
//  ContentView.swift
//  Task
//
//  Created by chuonpiseth on 25/4/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.createdAt, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<TaskItem>
    
    var body: some View {
        
        Button("Add Task") {
            let newTask = TaskItem(context: viewContext)
            
            newTask.title = "New Task"
            newTask.createdAt = Date()
            
            do {
                try viewContext.save()
                print("Save!")
            } catch {
                print("Error saving")
            }
        }
        
        List {
            ForEach(tasks) { task in
                Text(task.title ?? "No title")
            }
        }
        
    }
    
    
}



#Preview {
    ContentView()
}
