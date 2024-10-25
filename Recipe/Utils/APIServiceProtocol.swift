//
//  APIServiceProtocol.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchRecipes(url: URL?, completion: @escaping(Result<RecipeData, APIError>) -> Void)
}
