//
//  SessionManager.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import Foundation

class SessionManager: ObservableObject {
    @Published var sessionState: SessionState = .loggedOut
}
