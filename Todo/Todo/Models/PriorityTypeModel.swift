//
//  PriorityTypeModel.swift
//  Todo
//
//  Created by chuonpiseth on 25/3/26.
//

import Foundation
import SwiftUI

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
    
    var color: Color {
        switch self {
        case .normal:
            return .blue
        case .priority:
            return .red
        case .urgent:
            return .yellow
        }
    }
}


