//
//  PriorityTypeModel.swift
//  Todo
//
//  Created by chuonpiseth on 25/3/26.
//

import Foundation

enum PriorityType: String, CaseIterable, Identifiable {
    case normal, priority, urgent
    var id: Self { self }
    
    var title: String {
        switch self {
        case .normal:
            return "Normal"
        case .priority:
            return "Priority"
        case .urgent:
            return "Urgent"
        }
    }
}


