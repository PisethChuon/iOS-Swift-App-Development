//
//  TodoListView.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 17/3/26.
//

import SwiftUI

struct TodoListDisplayView: View {
    
    @ObservedObject var vm: TodoListViewModel
    
    var body: some View {
        List(vm.todos, id: \.self) { title in
            Text(title)
        }
    }
}
