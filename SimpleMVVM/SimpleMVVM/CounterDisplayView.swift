//
//  CounterDisplayView.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 16/3/26.
//

import SwiftUI

struct CounterDisplayView: View {
    
    @ObservedObject var vm: CounterViewModel
    
    var body: some View {
        Text("Current count: \(vm.count)")
            .font(.largeTitle)
    }
}
