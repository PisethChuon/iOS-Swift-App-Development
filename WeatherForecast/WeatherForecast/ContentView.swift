//
//  ContentView.swift
//  WeatherForecast
//
//  Created by chuonpiseth on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Mon")
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(Color.yellow)
                Text("Hight: 70")
                Text("Low: 50")
            }
            .padding()
            
            VStack {
                Text("Mon")
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(Color.yellow)
                Text("Hight: 60")
                Text("Low: 40")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
