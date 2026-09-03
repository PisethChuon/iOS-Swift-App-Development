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
                DayForecast(day: "Mon", isRainy: false, hight: 80, low: 50)
                DayForecast(day: "Tue", isRainy: true, hight: 60, low: 40)
                DayForecast(day: "Wed", isRainy: false, hight: 50, low: 30)
                DayForecast(day: "Thu", isRainy: true, hight: 80, low: 20)
            }
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
    
    var highAbove: Color {
        if (hight >= 80) {
            return Color.red
        }
        return Color.black
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
                .foregroundStyle(highAbove)
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
