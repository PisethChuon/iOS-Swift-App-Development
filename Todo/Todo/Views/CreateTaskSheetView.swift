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
        VStack(alignment: .leading, spacing: 20) {
            Text("Task Title")
                .font(.system(size: 16, weight: .bold))
            
            TextField("Task Title", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
            
            Text("Priority")
                .font(Font.system(size: 16, weight: .bold))
            Text("Normal")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal)
    }
}

#Preview {
    CreateTaskSheetView()
}
