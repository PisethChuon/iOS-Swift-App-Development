//
//  HomeViewModel.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import Foundation
import FirebaseAuth

@Observable
class HomeViewModel {
    var showSignOutAlert: Bool = false
    var showAddRecipeView: Bool = false
    
    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
