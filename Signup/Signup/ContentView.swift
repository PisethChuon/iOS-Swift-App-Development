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
    
    
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.primaryTheme.ignoresSafeArea()
            
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
                
                Text("Email")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.white)
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                Text("Password")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.white)
                    SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    
                    showAlert = true
                }) {
                    Text("Submit")
                        .foregroundStyle(Color.white)
                        .font(Font.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                }
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top)
            }
            .padding(.horizontal)
        }
        .alert("Sign Up Complete", isPresented: $showAlert) {
            Button("Ok", action: {
                
            })
        } message: {
            Text("Thanks for signing up!")
        }

    }
}

#Preview {
    ContentView()
}
