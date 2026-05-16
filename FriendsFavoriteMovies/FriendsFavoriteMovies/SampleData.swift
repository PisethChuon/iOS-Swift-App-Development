//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 7/5/26.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self,
        ])
        let modelCongiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelCongiguration])
            
            insertSampleData()
            
            try context.save()
        } catch {
            fatalError("Cound not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        Friend.sampleData[0].favoriteMovies = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovies = Movie.sampleData[0]
        Friend.sampleData[3].favoriteMovies = Movie.sampleData[4]
        
    }
}
