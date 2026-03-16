//
//  CounterControlView.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 16/3/26.
//

import SwiftUI

struct CounterControlView: View {
    
    @ObservedObject var vm: CounterViewModel
    
    var body: some View {
        Button("Increase") {
            vm.increase()
        }
    }
}
