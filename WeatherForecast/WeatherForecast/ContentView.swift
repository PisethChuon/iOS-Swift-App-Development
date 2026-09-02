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
            DayForecast(day: "Mon", hight: 70, low: 50)
            
            DayForecast(day: "Tue", hight: 60, low: 40)
        }
    }
}

struct DayForecast: View {
    let day: String
    let hight: Int
    let low: Int
    
    var body: some View {
        VStack {
            Text(day)
            Image(systemName: "sun.max.fill")
                .foregroundStyle(Color.yellow)
            Text("Hight: \(hight)")
            Text("Low: \(low)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
