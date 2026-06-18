//
//  RegisterView.swift
//  CookBook
//
//  Created by chuonpiseth on 18/6/26.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
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
            
            
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    RegisterView()
}
