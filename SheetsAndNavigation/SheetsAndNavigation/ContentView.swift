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
                isPresented = true
            }
            .fullScreenCover(isPresented: $isPresented) {
                SettingsView()
//                    .presentationDetents([.height(150) ,.medium, .large])
            }
        }
    }
    
struct SettingsView: View {
        var body: some View {
            Text("Settings")
        }
    }
    
}


#Preview {
    ContentView()
}
