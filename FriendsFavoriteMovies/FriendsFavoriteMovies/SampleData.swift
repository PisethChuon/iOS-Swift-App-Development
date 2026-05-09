//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 7/5/26.
//

import Foundation
import SwiftData


class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    init() {
        let schema = Schema([
            Friend.self,
            Moive.self,
        ])
        let modelCongiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelCongiguration])
        } catch {
            fatalError("Cound not create ModelContainer: \(error)")
        }
    }
}
