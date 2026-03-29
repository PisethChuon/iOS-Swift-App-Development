//
//  CreateTaskSheetView.swift
//  Todo
//
//  Created by chuonpiseth on 24/3/26.
//

import SwiftUI

struct AddTodoTask: View {
    
    @State private var taskTitle: String = ""
    @State private var selectedPriorityType: PriorityType = .normal
    @Environment(\.dismiss) private var dismiss
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var onAdd: (String, PriorityType) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            if verticalSizeClass == .compact{
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.black)
                    }
                }
                .padding(.top)
            }
            
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
                guard !taskTitle.isEmpty else { return }
                onAdd(taskTitle, selectedPriorityType)
                taskTitle = ""
                dismiss()
                
            } label: {
                Text("Add task")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.white)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal)
    }
}

#Preview {
    AddTodoTask { _, _ in }
}
