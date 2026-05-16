//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 10/5/26.
//

import SwiftUI
import SwiftData

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Moive", text: $movie.title)
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoriteBy.isEmpty {
                Section("Favorited by") {
                    ForEach(movie.favoriteBy) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Moive")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}
