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
            isShowingSheet.toggle()
        }) {
            Text("Show License Agreement")
        }
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiiss) {
            VStack {
                Text("License Agreement")
                    .font(.title)
                    .padding(50)
                Text("""
                    Terms and conditions go here.
                    """)
                .padding(50)
                Button("Dissmiss",
                       action: {isShowingSheet.toggle()})
            }
        }
    }
    func didDismiiss() {
        
    }
}

#Preview {
    ContentView()
}
