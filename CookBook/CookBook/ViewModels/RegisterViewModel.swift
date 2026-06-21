//
//  RegisterViewModel.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import Foundation
import FirebaseAuth

@Observable
class RegisterViewModel {
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var showPassword: Bool = false
    
    func signUp() async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
        } catch {
            
        }
    }
}
