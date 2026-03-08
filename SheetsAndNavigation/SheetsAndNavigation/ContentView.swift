//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showProfile: Bool = false
    
    var body: some View {
        VStack {
            Text("Home Screen")
            
            Button("Show Profile"){
                showProfile = true
            }
            .sheet(isPresented: $showProfile) {
                SheetsView()
            }
        }
    }
        
}

#Preview {
    ContentView()
}
