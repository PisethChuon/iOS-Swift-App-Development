//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by chuonpiseth on 3/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
