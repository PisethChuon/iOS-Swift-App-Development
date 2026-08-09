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
        guard let userId = Auth.auth().currentUser?.uid else {
            print("❌ No logged in user")
            return
        }
        do {
            let result = try await Firestore.firestore()
                .collection("recipes") // <-- double check this name
                .whereField("userId", isEqualTo: userId)
                .getDocuments()

            print("📦 Fetched \(result.documents.count) documents")

            for doc in result.documents {
                let data = doc.data()
                print("📄 Document data: \(data)")
                guard let imageLocation = data["image"] as? String else {
                    print("⚠️ Missing/bad 'image' field")
                    continue
                }
                // ...repeat for other fields
            }
        } catch {
            print("❌ Fetch error: \(error.localizedDescription)")
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
