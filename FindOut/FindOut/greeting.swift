//
//  greeting.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI

struct ProfileCard<Content: View>: View {
    let name: String
    let content: Content
    
    init(
        name: String,
        @ViewBuilder content: () -> Content
    ) {
        self.name = name
        self.content = content()
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(name)
                .font(.title2)
                .bold()
            
            content
        }
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
