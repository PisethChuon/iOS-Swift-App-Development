//
//  HomeView.swift
//  CookBook
//

import SwiftUI

struct HomeView: View {
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State var viewModel = HomeViewModel()
    
    fileprivate func ReceipeRow(receipe: Receipe) -> some View {
        VStack (alignment: .leading) {
            AsyncImage(url: URL(string: receipe.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
            } placeholder: {
                VStack {
                    ProgressView()
                }
            }

            
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
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    let spacing: CGFloat = 10
    let padding: CGFloat = 10
    
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
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.recipe) { receipe in
                                ReceipeRow(receipe: receipe)
                        }
                    }
                }

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
                    if viewModel.signOut() {
                        sessionManager.sessionState = .loggedOut
                    }
                })
                Button("Canel", role: .cancel) {}
            }
        }
        .task {
            await viewModel.fetchRecipes()
        }
        .sheet(isPresented: $viewModel.showAddRecipeView, content: {
            AddRecipeView()
        })
    }    
}

#Preview {
    HomeView()
        .environment(SessionManager())
}


