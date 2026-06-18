//
//  LoginView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .font(.system(size: 15))
            TextField("Email", text: $email)
                .font(.system(size: 14))
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            Rectangle()
                .frame(height: 1)
                .padding(.bottom, 15)
            
            Text("Password")
                .font(.system(size: 15))
            TextField("Password", text: $password)
                .font(.system(size: 15))
                .textInputAutocapitalization(.never)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    LoginView()
}
