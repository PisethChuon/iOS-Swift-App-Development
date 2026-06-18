//
//  LoginView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var presentRegister: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
}
