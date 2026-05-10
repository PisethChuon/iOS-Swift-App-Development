//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 9/5/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        Text("Detail view for \(movie.title)")
                            
                    }
                    
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add movie", systemImage: "plus", action: addMovie)
                }
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Moive")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    private func addMovie() {
        context.insert(Movie(title: "New Movie", releaseDate: .now))
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
