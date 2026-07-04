//
//  LoginView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

@Observable
class LoginViewModel {
    var presentRegister: Bool = false
    var email: String = ""
    var password: String = ""
    var showPassword: Bool = false
    var errorMessage: String = ""
    var presentAlert: Bool = false
    var isLoading: Bool = false
    
    func login() async -> User? {
        isLoading = true
        defer {
            isLoading = false
        }
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            let userId = result.user.uid
            let user = try await Firestore.firestore()
                .collection("users")
                .document(userId)
                .getDocument(as: User.self)
            return user
        } catch {
            let nsError = error as NSError

            // Check if the error domain is Firebase Auth
            if nsError.domain == AuthErrorDomain {
                switch nsError.code {
                case AuthErrorCode.wrongPassword.rawValue:
                    errorMessage = "Wrong password"
                case AuthErrorCode.invalidEmail.rawValue:
                    errorMessage = "Invalid email"
                case AuthErrorCode.userNotFound.rawValue:
                    errorMessage = "No account found for this email"
                default:
                    errorMessage = "Authentication error (code: \(nsError.code))"
                }
            } else {
                // Captures Firestore or general network errors
                errorMessage = nsError.localizedDescription
            }

            presentAlert = true
            return nil
        }
    }
}
