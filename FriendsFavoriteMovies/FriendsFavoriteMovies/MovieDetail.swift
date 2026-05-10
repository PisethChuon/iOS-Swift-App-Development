//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 10/5/26.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    
    var body: some View {
        Form {
            TextField("Moive", text: $movie.title)
        }
    }
}

#Preview {
    MovieDetail(movie: SampleData.shared.movieq)
}
