//
//  SessionManager.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import Foundation
import FirebaseAuth
import FirebaseCore

@Observable
class SessionManager {
    var sessionState: SessionState = .loggedOut
    var currentUser: User?
    
    init() {
        FirebaseApp.configure()
        sessionState = Auth.auth().currentUser != nil ? .loggedIn : .loggedOut
    }
}
