//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false
    @State private var sheetColor = Color.blue
    var body: some View {
        ZStack {
            sheetColor
            Button(action: {
                isShowingSheet = true
            }, label: {
                Text("Sheet")
            })
            .sheet(isPresented: $isShowingSheet, onDismiss: {
                sheetColor = Color.red
            }) {
                SheetsView()
            }
        }
    }
        
}

#Preview {
    ContentView()
}
