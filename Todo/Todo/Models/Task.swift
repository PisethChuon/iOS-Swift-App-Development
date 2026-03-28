//
//  Task.swift
//  Todo
//
//  Created by chuonpiseth on 28/3/26.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var priority: PriorityType
}

@Observable
class TaskViewModel {
    var tasks: [Task] = [
        Task(title: "Walk the dog", priority: .normal),
    ]
    
    func addTask(title: String, priority: PriorityType) {
        let task = Task(title: title, priority: priority)
        tasks.append(task)
    }
}
