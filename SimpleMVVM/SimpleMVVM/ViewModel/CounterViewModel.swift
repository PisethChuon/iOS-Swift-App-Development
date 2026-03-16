//
//  CounterViewModel.swift
//  SimpleMVVM
//
//  Created by chuonpiseth on 16/3/26.
//

import Foundation
import Combine
import SwiftUI

class CounterViewModel: ObservableObject {
    
    @Published var count = 0
    
    func increase() {
        count += 1
    }
    
}
