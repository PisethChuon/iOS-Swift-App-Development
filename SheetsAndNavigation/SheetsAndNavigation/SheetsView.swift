//
//  SheetsView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 8/3/26.
//

import SwiftUI

struct SheetsView: View {
//    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Text("Sheets content")
            Button("Close") {
                isPresented = false
            }
        }
    }
}

#Preview {
    SheetsView()
}
