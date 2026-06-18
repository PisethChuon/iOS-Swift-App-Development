//
//  LoginView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .font(.system(size: 15))
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textFieldStyle(AuthTextFieldStyle())
            
            Text("Password")
                .font(.system(size: 15))
            PasswordComponentView(showPassword: $viewModel.showPassword, password: $viewModel.password)
            
            Button {
                
            } label: {
                Text("Login")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
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
    }
}

#Preview {
    LoginView()
}
