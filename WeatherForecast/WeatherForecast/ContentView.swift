//
//  ContentView.swift
//  WeatherForecast
//
//  Created by chuonpiseth on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                DayForecast(day: "Mon", isRainy: true, high: 84, low: 50)
                DayForecast(day: "Tue", isRainy: false, high: 60, low: 40)
                DayForecast(day: "Wed", isRainy: true, high: 50, low: 30)
                DayForecast(day: "Thu", isRainy: false, high: 90, low: 60)
            }
        }
    }
}

struct DayForecast: View {
    var day: String
    var isRainy: Bool
    var high: Int
    var low: Int
    
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
    
    var hightAbove: Color {
        if (high > 80) {
            return Color.red
        }
        return Color.primary
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.title)
                .padding(5)
            Text("Hight: \(high)")
                .fontWeight(Font.Weight.bold)
                .foregroundStyle(hightAbove)
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
