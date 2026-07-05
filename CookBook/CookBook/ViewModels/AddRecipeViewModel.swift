//
//  AddRecipeViewModel.swift
//  CookBook
//
//  Created by chuonpiseth on 20/6/26.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseAuth

@Observable
class AddRecipeViewModel {
    var recipeName: String = ""
    var prepTime: Int = 0
    var instructions: String = ""
    var showImageOptions: Bool = false
    var showLibrary: Bool = false
    var displayedReceipeImage: Image?
    var receipeImage: UIImage?
}
