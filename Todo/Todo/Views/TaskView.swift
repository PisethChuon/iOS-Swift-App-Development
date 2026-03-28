//
//  TaskView.swift
//  Todo
//
//  Created by chuonpiseth on 28/3/26.
//

import SwiftUI

struct TaskView: View {
    
    struct Task: Identifiable {
        let id = UUID()
        var title: String
    }

    @State private var tasks = [
        Task(title: "Walk the dog"),
        Task(title: "Buy milk"),
    ]

    @State private var multiSelection = Set<UUID>()
    
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
