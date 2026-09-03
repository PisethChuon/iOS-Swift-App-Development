//
//  FeaturesCardSunrise.swift
//  OnboardingFlow
//
//  Created by chuonpiseth on 3/9/26.
//

import SwiftUI

struct FeaturesCardSunrise: View {
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Invest in your")
                
                Text("Personal grow while waiting")
            }
            .font(.largeTitle)
            .fontWeight(.semibold)
            
            Text("Get the knowledge and insight to make the most of your investments")
            
                Button("Get Started") {
                    
                }
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.top, 100)
        }
        .padding()
    }
}

#Preview {
    FeaturesCardSunrise()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
}
