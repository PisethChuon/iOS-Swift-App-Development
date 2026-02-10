//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.gray
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 8) {
                Text("Title at the top")
                    .font(.title3)
                    .bold()

                Text("Description")
                    .font(.subheadline)
            }
            .padding()

            Text("NEW")
                .font(.caption)
                .padding(6)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
