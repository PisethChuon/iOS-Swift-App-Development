//
//  greeting.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI

struct MyButtonModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
            .background(color)
            .clipShape(.capsule)
    }
}

extension View {
    func myButtonStyle(color: Color) -> some View {
        modifier(MyButtonModifier(color: color))
    }
}

struct greeting: View {
    var body: some View {
        Text("Hello, World!")
            .myButtonStyle(color: .green)
    }
}


#Preview {
    greeting()
}
