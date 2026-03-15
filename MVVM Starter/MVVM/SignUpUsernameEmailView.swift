//
//  ContentView.swift
//  MVVM
//
//

import SwiftUI

struct SignUpUsernameEmailView: View {
    
    @StateObject private var viewModel = SignUpUsernameEmailViewModel()

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading,spacing: 10) {
                Text("Username")
                    .font(.system(size: 15, weight: .semibold))
                TextField("Username", text: $viewModel.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom)
                Text("Email")
                    .font(.system(size: 15, weight: .semibold))
                TextField("Email", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom)
                Button {
                    guard !viewModel.username.isEmpty else {
                        viewModel.alertTitle = "Username Required"
                        viewModel.alertMessage = "Please provide a username"
                        viewModel.showAlert = true
                        return
                    }
                    guard !viewModel.email.isEmpty else {
                        viewModel.alertTitle = "Email Required"
                        viewModel.alertMessage = "Please provide a email"
                        viewModel.showAlert = true
                        return
                    }
                    viewModel.showNextPage = true
                } label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(.top)
            }
            .navigationDestination(isPresented: $viewModel.showNextPage, destination: {
                
            })
            .padding()
        }
    }
}

#Preview {
    SignUpUsernameEmailView()
}
