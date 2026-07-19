//
//  AddRecipeView.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    let preparationTimes = Array(stride(from: 0, through: 120, by: 5))
    
    @State var viewModel = AddRecipeViewModel()
    @StateObject var imageLoaderViewModel = ImageLoaderViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let pickerOptions = ForEach(preparationTimes, id: \.self) { time in
            Text("\(time) mins")
                .font(.system(size: 15))
                .tag(time)
        }
        
        ZStack {
            VStack(alignment: .leading) {
                Text("What's New")
                    .font(.system(size: 26, weight: .bold))
                    .padding(20)
                
                ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.primaryFormEntry)
                            .frame(height: 200)
                        Image(systemName: "photo.fill")
                    }
                    
                    if let displayedReceipeImage = viewModel.displayedReceipeImage {
                        displayedReceipeImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .clipped()
                    }
                }
                .onTapGesture {
                    viewModel.showImageOptions = true
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
                Picker(selection: $viewModel.preparationTime) {
                    pickerOptions
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
                    Task {
                        if let imageURL = await viewModel.upload() {
                            viewModel.addReceipe(imageURL: imageURL) { success in
                                if success {
                                    dismiss()
                                }
                            }
                        }
                    }
                }, label: {
                    Text("Add Recipe")
                    
                })
                .buttonStyle(PrimaryButtonStyle())
                
                Spacer()
            }
            .padding(.horizontal)
            .photosPicker(isPresented: $viewModel.showLibrary, selection: $imageLoaderViewModel.imageSelection, matching: .images, photoLibrary: .shared())
            .onChange(of: imageLoaderViewModel.imageToUpload, { _, newValue in
                if let newValue = newValue {
                    viewModel.displayedReceipeImage = Image(uiImage: newValue)
                    viewModel.receipeImage = newValue
                }
            })
            .confirmationDialog("Upload an image to your recipe", isPresented: $viewModel.showImageOptions, titleVisibility: .visible) {
                Button(action: {
                    viewModel.showLibrary = true
                }, label: {
                    Text("Upload an image from library")
                })
                Button(action: {
                    //                Padding
                }, label: {
                    Text("Upload an image from camera")
                })
            }
            if viewModel.isUploading {
                ProgressComponentView(value: $viewModel.uploadProgress)
            }
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button {
                
            } label: {
                Text("Ok")
            }
            
        } message: {
            Text(viewModel.alertMessage)
        }
        
    }
}

#Preview {
    AddRecipeView()
}
