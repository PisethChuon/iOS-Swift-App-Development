//
//  RegisterView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                
            } label: {
                Text("Sign up")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
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
    }
}

#Preview {
    RegisterView()
}
