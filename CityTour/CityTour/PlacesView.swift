//
//  ContentView.swift
//  CityTour
//
//

import SwiftUI

struct PlacesView: View {
    
    @StateObject private var viewModel = PlacesViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .task {
//            await apiClient.getPlaces(forKeyword: "Coffee", latitude: 11.612869658013633, longitude: 104.9082483642603)
        }
    }
}

#Preview {
    PlacesView()
}
