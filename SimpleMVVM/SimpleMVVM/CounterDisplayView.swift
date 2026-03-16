//
//  CounterDisplayView.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 16/3/26.
//

import SwiftUI
//import Combine

struct CounterDisplayView: View {
    
    @ObservableObject var vm: CounterViewModel
    
    var body: some View {
        Text("Current view: \(vm.count)")
    }
}

#Preview {
    CounterDisplayView()
}
