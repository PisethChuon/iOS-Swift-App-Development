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
        VStack {
            NavigationBarView

            Image("banner")
                .bannerImageStyle()

            Spacer()
            
        }
        
    }
}

#Preview {
    ContentView()
}
