//
//  TaskView.swift
//  Todo
//
//  Created by chuonpiseth on 28/3/26.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
}

struct TaskView: View {

    @State private var tasks = [
        Task(title: "Walk the dog"),
        Task(title: "Buy milk"),
    ]

    var body: some View {
        VStack {
            ForEach(tasks) { task in
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
}

#Preview {
    TaskView()
}
