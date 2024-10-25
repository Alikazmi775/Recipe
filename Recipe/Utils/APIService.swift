//
//  APIService.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation
import SwiftUI

struct APIService: APIServiceProtocol {
  
    func fetchRecipes(url: URL?, completion: @escaping(Result<RecipeData, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                do {
                    
                    let recipes = try JSONDecoder().decode(RecipeData.self, from: data)
                    completion(Result.success(recipes))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
