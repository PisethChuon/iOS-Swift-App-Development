//
//  RegisterView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(SessionManager.self) var sessionManager: SessionManager
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.system(size: 15))
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(AuthTextFieldStyle())
                
                Text("Email")
                    .font(.system(size: 15))
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(AuthTextFieldStyle())
                
                Text("Password")
                    .font(.system(size: 15))
                PasswordComponentView(showPassword: $viewModel.showPassword, password: $viewModel.password)
                
                Button {
                    Task {
                        if let user = await viewModel.signUp() {
                            sessionManager.sessionState = .loggedIn
                        }
                    }
                } label: {
                    Text("Sign up")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                HStack {
                    Spacer()
                    Text("Aleady have an account?")
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Login now")
                            .font(.system(size: 15, weight: .semibold))
                    })
                    Spacer()
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 10)
            if viewModel.isLoading { 
                LoadingComponentView()
            }
        }
        .alert("Error", isPresented: $viewModel.presentAlert) {
            
        } message: {
            Text(viewModel.errorMessage)
        }

    }
}

#Preview {
    RegisterView()
        .environment(SessionManager())
}
