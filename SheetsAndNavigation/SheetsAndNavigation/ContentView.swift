//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false
    var body: some View {
        Button(action: {
            isShowingSheet = true
        }, label: {
            Text("Sheet")
        })
        .sheet(isPresented: $isShowingSheet, content: {
            SheetsView()
        })
    }
        
}

#Preview {
    ContentView()
}
