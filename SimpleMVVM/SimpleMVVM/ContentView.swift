//
//  ContentView.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 16/3/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = TodoListViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("\(vm.title)")
                .font(.title)
            TodoListDisplayView(vm: vm)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    ContentView()
}
