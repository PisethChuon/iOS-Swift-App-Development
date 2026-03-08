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
            Text("Sheets contents")
            Button("Close") {
                dismiss()
            }
        }
    }
}

#Preview {
    SheetsView()
}
