//
//  ContentView.swift
//  CityTour
//
//

import SwiftUI

struct PlacesView: View {
    
    @StateObject private var viewModel = PlacesViewModel()
    
    private var HorizontalList: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(Keyword.allCases) { keyword in
                    Button {
                        viewModel.selectedKeyword = keyword
                    } label: {
                        Text(keyword.title)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(viewModel.selectedKeyword == keyword ? Color.gray : Color.black)
                            .padding(.horizontal, 10)
                    }
                    .scaleEffect(viewModel.selectedKeyword == keyword ? 0.85 : 1.0)
                }
            }
            .frame(height: 50)
        }
    }
    
    var body: some View {
        HorizontalList
        Spacer()
    }
}

#Preview {
    PlacesView()
}
