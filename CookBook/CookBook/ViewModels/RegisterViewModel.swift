//
//  RegisterViewModel.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class RegisterViewModel {
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var showPassword: Bool = false
    var isLoading: Bool = false
    var errorMessage = ""
    var presentAlert: Bool = false
    
    func signUp() async -> User? {
        guard validateUsername() else {
            errorMessage = "Username must be at least 3 characters"
            presentAlert = true
            return nil
        }
        
        guard let usernameDocuments = try? await Firestore.firestore().collection("users").whereField("username", isEqualTo: username).getDocuments() else {
            errorMessage = "Failed to connect to server"
            presentAlert = true
            return nil
        }
        
        guard usernameDocuments.documents.count == 0 else {
            errorMessage = "Username is already taken"
            presentAlert = true
            return nil
        }
        
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let userId = result.user.uid
            let user = User(id: userId, username: username, email: email)
            try Firestore.firestore().collection("users").document(userId).setData(from: user)
            return user
        } catch {
            // Cast directly to Firebase AuthErrorCode
            if let authError = error as? AuthErrorCode {
                switch authError.code {
                case .emailAlreadyInUse:
                    errorMessage = "Email is already in use"
                case .invalidEmail:
                    errorMessage = "Invalid email"
                case .wrongPassword:
                    errorMessage = "Wrong password"
                default:
                    errorMessage = "An unknown error occurred: \(error.localizedDescription)"
                }
            } else {
                // Catches Firestore errors or other network issues
                errorMessage = error.localizedDescription
            }
            
            presentAlert = true
            return nil
        }
    }
    
    func validateUsername() -> Bool {
        username.count >= 3 && username.count <= 25
    }
}
