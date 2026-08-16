//
//  ContentView.swift
//  Ecommerce
//
//

import SwiftUI

struct ContentView: View {
    fileprivate var NavigationBarView: some View {
        
        HStack {
            Spacer()
            Text("Ecommerce")
                .font(.system(size: 16, weight: .semibold))
            Spacer()
        }
        .overlay(alignment: .trailing) {
            Button(action: {
                
            }, label: {
                ZStack {
                    Image(systemName: "cart.fill")
                        .foregroundStyle(.black)
                    ZStack {
                        Circle().fill(Color.red)
                        Text("9")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .offset(x: 10, y: -10)
                }
            })
        }
        .padding(.trailing)
    }
    @State var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    NavigationBarView
                    
                    Image("banner")
                        .bannerImageStyle()
                    HStack {
                        Text("Featured")
                            .font(.system(size: 15, weight: .semibold))
                            .padding(.leading)
                        Spacer()
                        NavigationLink {
                            ProductGridView()
                        } label: {
                            Text("View All")
                                .font(.system(size: 15, weight: .semibold))
                                .padding(.trailing)
                        }
                    }
                    .padding(.top)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.featuredProducts(filter: .isFeatured)) {
                                product in
                                ProductRow(product: product)
                            }
                        }
                        
                    }
                    
                    HStack {
                        Text("Highly Rated")
                            .font(.system(size: 15, weight: .semibold))
                            .padding(.leading)
                        Spacer()
                        NavigationLink {
                            ProductGridView()
                        } label: {
                            Text("View All")
                                .font(.system(size: 15, weight: .semibold))
                                .padding(.trailing)
                        }
                    }
                    .padding(.top)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.featuredProducts(filter: .highlyRated)) {
                                product in
                                ProductRow(product: product)
                            }
                        }
                        
                    }
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
