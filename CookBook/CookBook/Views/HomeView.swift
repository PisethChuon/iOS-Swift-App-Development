//
//  HomeView.swift
//  CookBook
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var viewModel = HomeViewModel()
    
    let spacing: CGFloat = 5
    let padding: CGFloat = 5
    
    var itemWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth - (spacing * 2) - (padding * 2)) / 3
    }
    
    var itemHeight: CGFloat {
        return CGFloat(1.5) * itemWidth
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: spacing) {
                    VStack (alignment: .leading) {
                        Image(Receipe.mockReceipes[0].image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: itemWidth, height: itemHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .clipped()
                        Text(Receipe.mockReceipes[0].name)
                            .lineLimit(1)
                            .font(.system(size: 15, weight: .semibold))
                    }
                    VStack (alignment: .leading) {
                        Image(Receipe.mockReceipes[1].image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: itemWidth, height: itemHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .clipped()
                        Text(Receipe.mockReceipes[1].name)
                            .lineLimit(1)
                            .font(.system(size: 15, weight: .semibold))
                    }
                    VStack(alignment: .leading) {
                        Image(Receipe.mockReceipes[2].image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: itemWidth, height: itemHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .clipped()
                        Text(Receipe.mockReceipes[2].name)
                            .lineLimit(1)
                            .font(.system(size: 15, weight: .semibold))
                    }
                }
                .padding(.horizontal, padding)
                Spacer()
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


