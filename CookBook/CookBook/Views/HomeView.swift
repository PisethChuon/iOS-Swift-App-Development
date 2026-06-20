//
//  HomeView.swift
//  CookBook
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var viewModel = HomeViewModel()
    
    fileprivate func ReceipeRow(receipe: Receipe) -> some View {
        VStack (alignment: .leading) {
            Image(receipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: itemWidth, height: itemHeight)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            Text(receipe.name)
                .lineLimit(1)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(.black)
        }
    }
    
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
                    NavigationLink {
                        RecipeDetailView(recipe: Receipe.mockReceipes[0])
                    } label: {
                        ForEach(0...2, id: \.self) { index in
                            ReceipeRow(receipe: Receipe.mockReceipes[index])
                        }
                    }
                }
                .padding(.horizontal, padding)
                Spacer()
                Button(action: {
                    viewModel.showAddRecipeView = true
                }, label: {
                    Text("Add Recipe")
                })
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal)
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
        .sheet(isPresented: $viewModel.showAddRecipeView, content: {
            AddRecipeView()
        })
    }
    
}

#Preview {
    HomeView()
        .environmentObject(SessionManager())
}


