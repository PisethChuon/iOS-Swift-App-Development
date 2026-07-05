//
//  AddRecipeViewModel.swift
//  CookBook
//
//  Created by chuonpiseth on 20/6/26.
//
 
import Foundation
import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseAuth

@Observable
class AddRecipeViewModel {
    var recipeName: String = ""
    var prepTime: Int = 0
    var instructions: String = ""
    var showImageOptions: Bool = false
    var showLibrary: Bool = false
    var displayedReceipeImage: Image?
    var receipeImage: UIImage?
    
    func upload() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let imageID = UUID().uuidString.lowercased().replacingOccurrences(of: "-", with: "_")
        let imageName = "\(imageID).jpeg"
        let imagePath = "images/\(userId)/\(imageName)"
        let storageRef = Storage.storage().reference(withPath: imagePath)
    }
}
