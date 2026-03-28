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
}

@Observable
class TaskViewModel {
    var tasks: [Task] = [
        Task(title: "Walk the dog"),
        Task(title: "Buy milk"),
    ]
}
