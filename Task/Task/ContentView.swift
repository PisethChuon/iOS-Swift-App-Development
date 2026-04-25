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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.createdAt, ascending: true)])
    private var tasks: FetchedResults<TaskItem>
    
    var body: some View {
        Button("Add Task") {
            let newTask = TaskItem(context: viewContext)
            newTask.title = "My first task"
            newTask.createdAt = Date()
            
            do {
                try viewContext.save()
                print("Saved!")
            } catch {
                print("Error saving")
            }
        }
        List {
            ForEach(tasks) { task in
                Text(task.title ?? "No Title")
            }
        }
    }
    
}



#Preview {
    ContentView()
}
