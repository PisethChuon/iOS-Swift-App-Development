//
//  ContentView.swift
//  CityTour
//
//

import SwiftUI

struct PlacesView: View {
    
    @StateObject private var viewModel = PlacesViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(Keyword.allCases) { keyword in
                    Button {
                        
                    } label: {
                        Text(keyword.title)
                    }

                }
            }
        }
    }
}

#Preview {
    PlacesView()
}
