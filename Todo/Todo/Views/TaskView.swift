//
//  TaskView.swift
//  Todo
//
//  Created by chuonpiseth on 28/3/26.
//

import SwiftUI

// Model 'Task'
struct Task: Identifiable {
    let id = UUID()
    var title: String
}

struct TaskView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Walk the dog")
                Spacer()
                Text("Normal")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.pgreen)
                    .frame(width: 100, height: 23)
                    .background(Color.sgreen)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    TaskView()
}
