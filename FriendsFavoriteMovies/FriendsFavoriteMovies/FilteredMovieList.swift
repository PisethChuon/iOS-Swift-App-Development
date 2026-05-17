//
//  FilteredMovieList.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 17/5/26.
//

import SwiftUI
import SwiftData

struct FilteredMovieList: View {
    var body: some View {
        MovieList()
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
