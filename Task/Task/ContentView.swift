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
    
    var body: some View {
        Button("Add Task") {
            let newTask = Task(context: viewContext)
//            newTask.title = "My first task"
//            newTask.createdAt = Date()
        }
    }
    
}



#Preview {
    ContentView()
}
