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
        List {
            ForEach(movies) { movie in
                Text(movie.title)
//                Text(movie.releaseDate)
            }
        }
        
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
