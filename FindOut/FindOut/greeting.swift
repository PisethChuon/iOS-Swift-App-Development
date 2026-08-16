//
//  greeting.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI

struct MyButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
            .background(Color.blue)
            .clipShape(.capsule)
    }
}

extension View {
    func myButtonStyle() -> some View {
        modifier(MyButtonModifier())
    }
}

struct greeting: View {
    var body: some View {
        Text("Hello, World!")
            .myButtonStyle()
    }
}


#Preview {
    greeting()
}
