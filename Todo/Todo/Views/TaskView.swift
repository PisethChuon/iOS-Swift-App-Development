//
//  TaskView.swift
//  Todo
//
//  Created by chuonpiseth on 28/3/26.
//

import SwiftUI


struct TaskView: View {
    
    let task: Task

    var body: some View {
        VStack {
            
            HStack {
                Text(task.title)
                Spacer()
                Text("Normal")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.green)
                    .frame(width: 100, height: 23)
                    .background(Color.green.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .padding(.horizontal, 15)
            
        }
    }
}

#Preview {
    TaskView(task: Task(title: "Walk the dog", priority: .normal))
}
