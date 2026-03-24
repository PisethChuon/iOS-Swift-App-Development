//
//  CreateTaskSheetView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI

struct CreateTaskSheetView: View {
    
    @State private var taskTitle: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Task Title")
            
            TextField("Task Title", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal)
    }
}

#Preview {
    CreateTaskSheetView()
}
