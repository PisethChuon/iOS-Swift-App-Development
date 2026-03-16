//
//  CounterViewModel.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 16/3/26.
//

import Foundation
import Combine
import SwiftUI

class TodoListViewModel: ObservableObject {
    @Published var title: String = "My Tasks"
}
