//
//  HomeView.swift
//  CookBook
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack {
            Text("Cooking Book App!")
        }
    }
    
}

#Preview {
    HomeView()
        .environmentObject(SessionManager())
}


