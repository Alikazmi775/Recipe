//
//  Recipes.swift
//  Recipes
//
//  Created by Ali on 10/18/24.
//

import Foundation

struct Recipes : Codable {
    let cuisine : String?
    let name : String?
    let photo_url_large : String?
    let photo_url_small : String?
    let source_url : String?
    let uuid : String?
    let youtube_url : String?

    enum CodingKeys: String, CodingKey {

        case cuisine = "cuisine"
        case name = "name"
        case photo_url_large = "photo_url_large"
        case photo_url_small = "photo_url_small"
        case source_url = "source_url"
        case uuid = "uuid"
        case youtube_url = "youtube_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cuisine = try values.decodeIfPresent(String.self, forKey: .cuisine)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        photo_url_large = try values.decodeIfPresent(String.self, forKey: .photo_url_large)
        photo_url_small = try values.decodeIfPresent(String.self, forKey: .photo_url_small)
        source_url = try values.decodeIfPresent(String.self, forKey: .source_url)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        youtube_url = try values.decodeIfPresent(String.self, forKey: .youtube_url)
    }

    init(name: String, cuisine: String, photoUrlLarge: String, photoUrlSmall: String, sourceUrl: String, uuid: String, youtubeUrl: String){
        self.name = name
        self.cuisine = cuisine
        self.photo_url_large = photoUrlLarge
        self.photo_url_small = photoUrlSmall
        self.source_url = sourceUrl
        self.uuid = uuid
        self.youtube_url = youtubeUrl
    }
    
    
    static func example1() -> Recipes {
        return Recipes(name: "Apam Balik", cuisine: "Malaysian", photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ", uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg")
    }
    
}
