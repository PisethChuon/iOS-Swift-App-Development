import Foundation

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var showAlertInUserEmailView = false
    @Published var showAlertInPasswordView = false
    @Published var showNextPage = false
    @Published var confirmPassword = ""
    
    func validate() {
        guard validateUsername() && validateUsername() else { return }
        showNextPage = true
    }
    
    func confirmSignUp() {
        if password == confirmPassword {
            alertTitle = "Success!"
            alertMessage = "Please check your email for the activation link."
        } else {
            alertTitle = "Password Mismatch!"
            alertMessage = "Please check passwords."
            password = ""
            confirmPassword = ""
        }
        showAlertInPasswordView = true
    }
    
    func handlePasswordViewAlert() {
        if password == confirmPassword {
            showNextPage = false
        } else {
            showAlertInPasswordView = false
        }
    }
    
    private func validateUsername() -> Bool {
        guard !username.isEmpty else {
            alertTitle = "Username Required"
            alertMessage = "Please provide a username"
            showAlertInUserEmailView = true
            return false
        }
        return true
    }
    
    private func validateEmail() -> Bool {
        guard !email.isEmpty else {
            alertTitle = "Email Required"
            alertMessage = "Please provide a email"
            showAlertInUserEmailView = true
            return false
        }
        return true
    }
}
