//
//  CreateTaskSheetView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI

struct CreateTaskSheetView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Task Title")
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

#Preview {
    CreateTaskSheetView()
}
