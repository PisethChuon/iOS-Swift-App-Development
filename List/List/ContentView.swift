//
//  ContentView.swift
//  List
//
//  Created by chuonpiseth on 19/3/26.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject private var vm = FruitViewModel()
    
    var body: some View {
        
        List(vm.fruits) { fruit in
            Text(fruit.name)
        }
        
    }
    
}

#Preview {
    ContentView()
}
