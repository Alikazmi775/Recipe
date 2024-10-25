//
//  RecipeTests.swift
//  RecipeTests
//
//  Created by Ali on 10/18/24.
//

import XCTest
import Combine
@testable import Recipe

class RecipeViewModelTests: XCTestCase {

    var viewModel: RecipeViewModel!
    var subscriptions = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        viewModel = RecipeViewModel()
    }

    override func tearDown() {
        viewModel = nil
        subscriptions = []
        super.tearDown()
    }

    // MARK: - Success Test

    func test_fetchAllRecipes_success() {
        // Given: Setting up the mock service to return success with one recipe
        let recipe = Recipes(
            name: "Apam Balik",
            cuisine: "Malaysian",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
            youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        )
        //mockService.mockRecipes = [recipe]

        let promise = expectation(description: "Successfully fetched recipes")

        // When: Calling fetchAllRecipe and observing the output
        viewModel.$recipes.sink { recipes in
            if recipes.count == 1 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)

        viewModel.fetchAllRecipe()

        // Then: Waiting for the expectation to be fulfilled
        wait(for: [promise], timeout: 50)
    }

    // MARK: - Failure Test

    func test_fetchAllRecipes_failure() {
        // Given: Setting up the mock service to return a failure
       // mockService.shouldReturnError = true

        let promise = expectation(description: "Error message should be set")

        // When: Calling fetchAllRecipe and observing the errorMessage
        viewModel.$errorMessage.sink { errorMessage in
            if errorMessage != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)

        viewModel.fetchAllRecipe()

        // Then: Waiting for the expectation to be fulfilled
        wait(for: [promise], timeout: 50)
    }
}

