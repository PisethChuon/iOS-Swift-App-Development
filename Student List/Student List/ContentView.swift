//
//  ContentView.swift
//  Student List
//
//  Created by chuonpiseth on 25/2/26.
//

import SwiftUI

// Protocol: Rule Book
protocol Displayable {
    var displayName: String { get }
}

// Student Model
struct Student: Identifiable, Equatable, Hashable, Displayable {
    let id: UUID
    let name: String
    let age: Int
    let grade: Double
    
    var displayName: String {
        "\(name) - Age: \(age) - Grade: \(grade)"
    }
}

extension Student {
    func isAdult() -> Bool {
        age >= 18
    }
    
    func isPassed() -> Bool {
        grade >= 50
    }
}

struct ContentView: View {
    
//    Sample Data
    let students: [Student] = [
        Student(id: UUID(), name: "Piseth", age: 22, grade: 85),
        Student(id: UUID(), name: "Dara", age: 17, grade: 45),
        Student(id: UUID(), name: "Sokha", age: 20, grade: 60),
    ]
    
    var body: some View {   // Opaque Type
        VStack {
            Text("Student List")
                .font(.title)
                .padding()
            
            List(students) { student in     // Used Indentifiable (Identity)
                Text(student.displayName)
                    .font(.headline)
                
                Text(student.isPassed() ? "Passed" : "Failed")
                    .foregroundColor(student.isPassed() ? .green : .red)
                
                Text(student.isAdult() ? "Adult" : "Minor")
                    .font(.caption)
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    ContentView()
}

// Test Equatable + Hashable
func testEqualityAndSet() {
    let s1 = Student(id: UUID(), name: "Piseth", age: 22, grade: 85)
    let s2 = Student(id: s1.id, name: "Piseth", age: 22, grade: 85)
    
    print("Are equal", s1 == s2)    // Equntable
    
}
