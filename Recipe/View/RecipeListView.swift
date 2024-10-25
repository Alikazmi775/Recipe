//
//  RecipeListView.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation
import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()
    @State private var searchText: String = ""
    @State private var isActive = false  // Track navigation

    var filteredRecipes: [Recipes] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter {
                $0.name?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    LazyVStack {
                        ForEach(filteredRecipes, id: \.name) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: recipe),
                                isActive: $isActive
                            ) {
                                RecipeRowView(recipe: recipe)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Yummy Recipes")
            .searchable(text: $searchText)
            .refreshable {
                viewModel.fetchAllRecipe()
            }
            .onAppear {
                viewModel.fetchAllRecipe()
                isActive = false  // Reset navigation state on appear
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
