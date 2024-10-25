//
//  ErrorView.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    var body: some View {
        VStack {
            Text("🙁")
                .font(.system(size: 80))
            
            Text(recipeViewModel.errorMessage ?? "")
            
            Button {
                recipeViewModel.fetchAllRecipe()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(recipeViewModel: RecipeViewModel())
    }
}
