//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let price = 99.9999
        
        VStack {
            
            Text("Price: \(price, specifier: "%.4f")")
                
        }
    }
}

#Preview {
    ContentView()
}
