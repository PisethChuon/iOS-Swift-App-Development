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
    
    func signUp() async -> Bool {
        do {
            isLoading = true
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let userId = result.user.uid
            let userData: [String: Any] = [
                "username": username,
                "email": email
            ]
            try await Firestore.firestore().collection("users").document(userId).setData(userData)
            isLoading = false
            return true
        } catch(let error) {
            let nsError = error as NSError
            if let authError = AuthErrorCode(_bridgedNSError: nsError) {
                switch authError.code {
                case .emailAlreadyInUse:
                    errorMessage = "Email is already in use"
                    break
                case .invalidEmail:
                    errorMessage = "Invalid email"
                    break
                case .wrongPassword:
                    errorMessage = "Wrong password"
                    break
                default:
                    break
                }
            }
            return false
        }
    }
}
