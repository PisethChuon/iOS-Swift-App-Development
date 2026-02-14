//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let name: String = "Piseth Chuon"
        let job: String = "iOS Developer"
        let status: Int? = 1
        
        VStack {
            Text("\(name)")
                .font(.largeTitle)
                .bold()
            Text("\(job)")
                .font(.subheadline)
                .foregroundStyle(.gray)
            Text(status == 1 ? "Online" : "Offline")
                .foregroundStyle(status == 1 ? .green : .red)
                .italic()
        }
    }
}

#Preview {
    ContentView()
}
