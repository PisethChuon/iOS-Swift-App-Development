//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Button("Sheet") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented, onDismiss: didDismiss) {
                
                Text("Hello, World!")
            }
        }
    }
    func didDismiss() {
        
    }
}


#Preview {
    ContentView()
}
