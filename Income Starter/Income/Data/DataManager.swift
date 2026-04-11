//
//  DataManager.swift
//  Income
//
//  Created by chuonpiseth on 11/4/26.
//

import Foundation
import CoreData

class DataManager {
    let container = NSPersistentContainer(name: "IncomeData")
    static let shared = DataManager()
    
    private init() {
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
