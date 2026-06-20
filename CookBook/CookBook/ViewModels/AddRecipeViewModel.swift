//
//  AddRecipeViewModel.swift
//  CookBook
//
//  Created by chuonpiseth on 20/6/26.
//

import Foundation

class AddRecipeViewModel: ObservableObject {
    @Published var recipeName: String = ""
    @Published var prepTime: Int = 0
    @Published var instructions: String = ""
}
