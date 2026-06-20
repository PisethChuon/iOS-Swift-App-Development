//
//  AddRecipeView.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import SwiftUI

struct AddRecipeView: View {
    @State var viewModel = AddRecipeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("What's New")
                .font(.system(size: 26, weight: .bold))
                .padding(20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.primaryFormEntry)
                    .frame(height: 200)
                Image(systemName: "photo.fill")
            }
            Text("Recipe Name")
                .padding(.top)
                .font(.system(size: 15, weight: .semibold))
            
            TextField("Recipe Name", text: $viewModel.recipeName)
                .textFieldStyle(CapsuleTextFieldStyle())
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            Text("Preparation Time")
                .font(.system(size: 15, weight: .semibold))
                .padding(.top)
            Picker(selection: $viewModel.prepTime) {
                ForEach(0..<120, id: \.self) { time in
                    if time % 5 == 0 {
                        Text("\(time) min")
                            .font(.system(size: 15))
                            .tag(time)
                    }
                    
                }
            } label: {
                Text("Prep Time")
            }
            Text("Cooking Instructions")
                .font(.system(size: 15, weight: .semibold))
                .padding(.top)
            TextEditor(text: $viewModel.instructions)
                .frame(height: 150)
                .background(Color.primaryFormEntry)
                .scrollContentBackground(.hidden)
                .clipShape(RoundedRectangle(cornerRadius: 10) )
            
            Button(action: {
                
            }, label: {
                Text("Add Recipe")
                    
            })
            .buttonStyle(PrimaryButtonStyle())
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    AddRecipeView()
}
