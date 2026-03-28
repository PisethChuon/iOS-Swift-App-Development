//
//  CreateTaskSheetView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI

struct CreateTaskSheetView: View {
    
    @State private var taskTitle: String = ""
    @State private var selectedPriorityType: PriorityType = .normal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Task Title")
                .font(.system(size: 16, weight: .bold))
            
            TextField("Task Title", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
            
            Text("Priority")
                .font(Font.system(size: 16, weight: .bold))
            Picker("Choose Priority", selection: $selectedPriorityType) {
                ForEach(PriorityType.allCases) { priority in
                    Text(priority.title)
                        .tag(priority)
                }
            }
            Button {
                
            } label: {
                Text("Add task")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.white)
                    .background(Color.primaryLightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal)
    }
}

#Preview {
    CreateTaskSheetView()
}
