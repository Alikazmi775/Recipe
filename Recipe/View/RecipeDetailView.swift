//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Ali on 10/18/24.
//

import Foundation
import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipes
    let imageSize: CGFloat = 300
    
    @State private var uiImage: UIImage? = nil
    @State private var isLoading: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                if let image = uiImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: imageSize)
                        .clipped()
                } else {
                    if isLoading {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        Color.gray
                            .frame(height: imageSize)
                            .onAppear {
                                loadImage()
                            }
                    }
                }

                VStack(alignment: .leading, spacing: 15) {
                    HStack(alignment: .top) {
                        Text("Recipe Name:")
                            .font(.headline)
                            .bold()
                        Spacer()
                        Text(recipe.name ?? "Unknown Recipe")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }

                    HStack(alignment: .top) {
                        Text("Cuisine:")
                            .font(.headline)
                            .bold()
                        Spacer()
                        Text(recipe.cuisine ?? "Unknown Cuisine")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    // Loads the image from cache or downloads it if not cached.
    private func loadImage() {
        guard let urlString = recipe.photo_url_large, let url = URL(string: urlString) else {
            return
        }

        // Check if the image is already cached.
        if let cachedImage = ImageCache.shared.image(forKey: urlString) {
            self.uiImage = cachedImage
        } else {
            // Download and cache the image.
            downloadImage(from: url) { image in
                if let image = image {
                    ImageCache.shared.save(image, forKey: urlString)
                    DispatchQueue.main.async {
                        self.uiImage = image
                    }
                }
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
            self.isLoading = true
        }
    }

    // Downloads the image from the provided URL.
    private func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}

