//
//  ContentView.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 16/3/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(vm.count)")
            Button("Increase") {
                vm.increase()
            }
        }
    }
}

#Preview {
    ContentView()
}
