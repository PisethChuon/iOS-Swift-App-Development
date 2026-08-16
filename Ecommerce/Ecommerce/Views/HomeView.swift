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
    
    var body: some View {
        NavigationStack {
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
                
                ScrollView(.horizontal) {
                    VStack(alignment: .leading, spacing: 5) {
                        Image("backpack")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(UnevenRoundedRectangle(
                                cornerRadii: .init(
                                    topLeading: 8,
                                    bottomLeading: 0,
                                    bottomTrailing: 0,
                                    topTrailing: 8)))
                            .clipped()
                        Group {
                            Text("Title")
                                .font(.system(size: 15, weight: .semibold))
                            Text("$100.00")
                                .font(.system(size: 15, weight: .semibold))
                            HStack {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color.yellow)
                                Text("4.5")
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(.horizontal, 5)
                        Spacer()
                    }
                    .frame(width: 150, height: 270)
                    .overlay(alignment: .topTrailing, content: {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "heart")
                        })
                        .padding(8)
                    })
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(uiColor: UIColor.lightGray)
                                .opacity(0.4), lineWidth: 1)
                    }
                }
                Spacer()
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
