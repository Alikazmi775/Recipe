//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    
    @Published var recipes = [Recipes]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllRecipe()
    }
    
    func fetchAllRecipe() {
        isLoading = true
        errorMessage = nil

        let url = URL(string: APIUrl.ALLRECIPES)
        service.fetchRecipes(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.description)
                    print(error)
                    
                case .success(let recipeData):
                    if let recipes = recipeData.recipes, !recipes.isEmpty {
                        print("--- success with \(recipes.count) recipes")
                        self.recipes = recipes
                    } else {
                        print("--- success but no recipes found")
                        self.errorMessage = "No recipes available at the moment."
                        self.recipes = [] // Clear the recipes list if it's empty
                    }
                }
            }
        }
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> RecipeViewModel {
        let fetcher = RecipeViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> RecipeViewModel {
        let fetcher = RecipeViewModel()
        return fetcher
    }
}
