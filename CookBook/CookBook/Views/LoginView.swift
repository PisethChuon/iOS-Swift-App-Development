//
//  LoginView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel = LoginViewModel()
    @Environment(SessionManager.self) var sessionManager: SessionManager
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.system(size: 15))
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(AuthTextFieldStyle())
                
                Text("Password")
                    .font(.system(size: 15))
                PasswordComponentView(showPassword: $viewModel.showPassword, password: $viewModel.password)
                
                Button(action: {
                    Task {
                        if let user = await viewModel.login() {
                            await MainActor.run {
                                sessionManager.currentUser = user
                                sessionManager.sessionState = .loggedIn
                            }
                        }
                    }
                }, label: {
                    Text("Login")
                })
                .buttonStyle(PrimaryButtonStyle())
                
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                    Button(action: {
                        viewModel.presentRegister = true
                    }, label: {
                        Text("Register now")
                            .font(.system(size: 15, weight: .semibold))
                    })
                    Spacer()
                }
                .padding(.top, 20)
                
            }
            .padding(.horizontal, 10)
            .fullScreenCover(isPresented: $viewModel.presentRegister, content: {
                RegisterView()
            })
            if viewModel.isLoading {
                LoadingComponentView()
            }
        }
        .alert("Error logging in", isPresented: $viewModel.presentAlert) {
        } message: {
            Text(viewModel.errorMessage)
        }

    }
}

#Preview {
    LoginView()
        .environment(SessionManager())
}
