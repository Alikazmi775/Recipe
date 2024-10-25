//
//  ContentView.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var recipeViewModel = RecipeViewModel()

    var body: some View {
        if recipeViewModel.isLoading {
            LoadingView()
        }else if recipeViewModel.errorMessage != nil  {
            ErrorView(recipeViewModel: recipeViewModel)
        }else {
            RecipeListView()
        }
    }
}

#Preview {
    ContentView()
}
