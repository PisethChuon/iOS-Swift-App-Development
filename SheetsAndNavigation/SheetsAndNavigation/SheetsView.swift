//
//  SheetsView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 8/3/26.
//

import SwiftUI

struct SheetsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .font(Font.system(size: 100))
                .foregroundStyle(Color.blue)
            VStack (spacing: 20) {
                Text("User Profile")
                Text("Name: Piseth")
            }
            Button("Close") {
                dismiss()
            }
            .padding(20)
            
        }
    }
}

#Preview {
    SheetsView()
}
