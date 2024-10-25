//
//  RecipeData.swift
//  Recipe
//
//  Created by Ali on 10/20/24.
//

import Foundation

struct RecipeData : Codable {
    let recipes : [Recipes]?

    enum CodingKeys: String, CodingKey {

        case recipes = "recipes"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recipes = try values.decodeIfPresent([Recipes].self, forKey: .recipes)
    }
}
