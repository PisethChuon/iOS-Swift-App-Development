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
                        MovieDetail(movie: movie)
                            
                    }
                }
                .onDelete(perform: deleteMovie(indexes:))
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add movie", systemImage: "plus", action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
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
    
    private func deleteMovie(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
