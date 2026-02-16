//
//  ContentView.swift
//  Signup
//
//  Created by chuonpiseth on 16/2/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    
    @State private var showUsernameError: Bool = false
    @State private var showEmailError: Bool = false
    @State private var showPasswordError: Bool = false
    
    var body: some View {
        ZStack {
            Color.primaryTheme
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("Sign Up")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundStyle(Color.white)
                Text("Username")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.white)
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if showUsernameError {
                    Text("Username is required")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(Color.red)
                }
                
                Text("Email")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.white)
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if showEmailError {
                    Text("Email is required")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(Color.red)
                }
                
                Text("Password")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.white)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                if showPasswordError {
                    Text("Password is required")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(Color.red)
                }
                    
                Button(action: {
                    showUsernameError = false
                    showEmailError = false
                    showPasswordError = false
                    
                    guard !username.isEmpty else {
                        showUsernameError = true
                        return
                    }
                    guard !email.isEmpty else {
                        showEmailError = true
                        return
                    }
                    guard !password.isEmpty else {
                        showPasswordError = true
                        return
                    }
                    showAlert = true
                    
                    username = ""
                    email = ""
                    password = ""
                    
                }) {
                    Text("Submit")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                }
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .alert("Sign Up Complete", isPresented:
            $showAlert) {
            Button("OK", action: {
                
            })
        } message: {
            Text("Thanks for signing up!")
        }

    }
}

#Preview {
    ContentView()
}
