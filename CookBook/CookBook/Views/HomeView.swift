//
//  HomeView.swift
//  CookBook
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Cooking Book App!")
            }
            .toolbar(content: {
                ToolbarItem {
                    Button(action: {
                        viewModel.showSignOutAlert = true
                    }, label: {
                        Image(systemName: "gearshape.fill")
                    })
                }
            })
            .alert("Are you sure you want to Sign Out?", isPresented: $viewModel.showSignOutAlert) {
                Button("Sign Out", role: .destructive, action: {
                    sessionManager.sessionState = .loggedOut
                })
                Button("Canel", role: .cancel) {
                    
                }
            }
        }
    }
    
}

#Preview {
    HomeView()
        .environmentObject(SessionManager())
}


