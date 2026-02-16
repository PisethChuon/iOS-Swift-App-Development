//
//  ContentView.swift
//  Signup
//
//  Created by chuonpiseth on 16/2/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    
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
                Spacer()
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    ContentView()
}
