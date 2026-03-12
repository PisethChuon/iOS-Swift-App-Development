//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let title: String
}

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Button("Sheet") {
                
            }
            .sheet(isPresented: $isPresented, content: {
                
            })
        }
    }
}


#Preview {
    ContentView()
}
