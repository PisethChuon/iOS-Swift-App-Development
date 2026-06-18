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
            AuthTextFieldView(inputTextField: $viewModel.email)
            Rectangle()
                .frame(height: 1)
                .padding(.bottom, 15)
            
            Text("Password")
                .font(.system(size: 15))
            SecureField("Password", text: $viewModel.password)
                .font(.system(size: 15))
            Rectangle()
                .frame(height: 1)
                .padding(.bottom, 15)
            
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

struct AuthTextFieldView: View {
    @Binding var inputTextField: String
    
    var body: some View {
        TextField("Email", text: $inputTextField)
            .font(.system(size: 14))
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
    }
}
