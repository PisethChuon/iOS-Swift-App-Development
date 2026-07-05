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
    var uploadProgress: Float = 0
    var isUploading: Bool = false
    var showAlert: Bool = false
    
    func addReceipe() {
        
    }
    
    func upload() async {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        guard let receipeImage = receipeImage,
        let imageData = receipeImage.jpegData(compressionQuality: 0.7)
        else {
            return
        }
        
        let imageID = UUID().uuidString.lowercased().replacingOccurrences(of: "-", with: "_")
        let imageName = "\(imageID).jpg"
        let imagePath = "images/\(userId)/\(imageName)"
        let storageRef = Storage.storage().reference(withPath: imagePath)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        isUploading = true
        do {
            let result = try await storageRef.putDataAsync(imageData, metadata: metaData) { progress in
                if let progress = progress {
                    let percenComplete = Float(progress.completedUnitCount / progress.totalUnitCount)
                    self.uploadProgress = percenComplete
                }
            }
            isUploading = false
        } catch {
            isUploading = false
        }
        
    }
    
    private func createAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}
