//
//  TodoListControlView.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 17/3/26.
//

import SwiftUI

struct TodoListControlView: View {
    
    @ObservedObject var vm: TodoListViewModel
    
    var body: some View {
        Button("Add") {
            vm.addTodo("Buy me a coffee!")
        }
    }
}
