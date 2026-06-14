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
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.black)
                            .padding(.horizontal, 10)
                    }

                }
            }
            .frame(height: 50)
        }
        .background(Color.red)
        Spacer()
    }
}

#Preview {
    PlacesView()
}
