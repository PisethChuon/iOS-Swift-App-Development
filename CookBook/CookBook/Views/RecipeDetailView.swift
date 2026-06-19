//
//  RecipeDetailView.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Receipe
    
    var body: some View {
        VStack {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .clipped()
            HStack {
                Text(recipe.name)
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
                Image(systemName: "clock.fill")
                Text("\(recipe.time) min")
            }
            .padding(.top)
            .padding(.horizontal)
            Text(recipe.instructions)
                .font(.system(size: 15))
                .padding(.top, 15)
                .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    RecipeDetailView(recipe: Receipe.mockReceipes[0])
}
