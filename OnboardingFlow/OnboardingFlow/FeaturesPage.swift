//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by chuonpiseth on 3/9/26.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack {
            Text("Features")
                .font(Font.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description of the feature card that is going to be displayed.")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
}
