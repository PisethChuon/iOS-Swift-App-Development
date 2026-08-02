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
    var recipe: [Receipe] = []
    
    func fetchRecipes() async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        do {
            let receipesResult = try await Firestore.firestore().collection("receipes").whereField("userId", isEqualTo: userId).getDocuments()
            for receipeDocument in receipesResult.documents {
                let data = receipeDocument.data()
                guard let imageLocation = data["image"] as? String else { continue }
                guard let instructions = data["instructions"] as? String else { continue }
                guard let name = data["name"] as? String else { continue }
                guard let time = data["time"] as? Int else { continue }
                guard let userId = data["userId"] as? String else { continue }
                let id = receipeDocument.documentID
                let receipe = Receipe(id: id, name: name, image: imageLocation, instructions: instructions, time: time)
                recipe.append(receipe)
            }
        } catch {
            print("Failed to fetch recipes: \(error.localizedDescription)")
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
