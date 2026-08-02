//
//  HomeViewModel.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class HomeViewModel {
    var showSignOutAlert: Bool = false
    var showAddRecipeView: Bool = false
    var recipe: [Recipe] = []
    
    func fetchRecipes() async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        do {
            let receipes = try await Firestore.firestore().collection("receipes").whereField("userId", isEqualTo: userId).getDocuments()
                
            }
        } catch {
            
        }
    }
    
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
