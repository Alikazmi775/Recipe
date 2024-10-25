//
//  APIMockService.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<RecipeData, APIError>

    func fetchRecipes(url: URL?, completion: @escaping (Result<RecipeData, APIError>) -> Void) {
        completion(result)
    }

}
