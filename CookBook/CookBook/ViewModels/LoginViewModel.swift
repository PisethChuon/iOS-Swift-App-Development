//
//  LoginView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import Foundation
import SwiftUI

@Observable
class LoginViewModel {
    var presentRegister: Bool = false
    var email: String = ""
    var password: String = ""
    var showPassword: Bool = false
}
