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
            DayForecast(day: "Mon", isRainy: false, hight: 70, low: 50)
            
            DayForecast(day: "Tue", isRainy: true, hight: 60, low: 40)
        }
    }
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let hight: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            Text("Hight: \(hight)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
