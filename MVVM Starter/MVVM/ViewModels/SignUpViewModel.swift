import Foundation

import SwiftUI

class SignUpUsernameEmailViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var showAlert = false
    @Published var showNextPage = false
    
    func validate() {
        guard validateUsername() && validateUsername() else { return }
        showNextPage = true
    }
    
    private func validateUsername() -> Bool {
        guard !username.isEmpty else {
            alertTitle = "Username Required"
            alertMessage = "Please provide a username"
            showAlert = true
            return false
        }
        return true
    }
    
    private func validateEmail() -> Bool {
        guard !email.isEmpty else {
            alertTitle = "Email Required"
            alertMessage = "Please provide a email"
            showAlert = true
            return false
        }
        return true
    }
}
