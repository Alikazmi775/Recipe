//
//  ImageCache.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()

    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func save(_ image: UIImage?, forKey key: String) {
        guard let image = image else { return }
        cache.setObject(image, forKey: key as NSString)
    }
}
