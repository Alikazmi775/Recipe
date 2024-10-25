# Yummy Recipes App
demo: REST API with SwiftUI


# Project Overview
The Yummy Recipes App is a SwiftUI-based application that displays a list of recipes fetched from an external API. It follows the MVVM (Model-View-ViewModel) architecture pattern, ensuring separation of concerns and better code management. Users can:

> View a list of delicious recipes.
> Navigate to a detailed screen for each recipe.
> Search for recipes using the search bar.
> Refresh the list with pull-to-refresh functionality.
> Handle empty responses and errors gracefully with appropriate messages.



# Features
> MVVM Architecture: Clean separation between UI and business logic.
> Pull-to-Refresh: Users can refresh the recipe list anytime.
> Lazy Loading: Images are loaded on demand to optimize network usage.
> Error Handling: Shows appropriate error messages for network failures.
> Offline Mode: Displays an error message when the user is offline.
> Responsive UI: Uses SwiftUI for a modern, adaptive layout.



# Project Structure
YummyRecipes/
│
├── Models/                     # Model definitions (Recipes, APIResponse, etc.)
│   └── Recipes.swift
|
│
├── ViewModels/                 # ViewModel handling business logic
│   └── RecipeViewModel.swift
│
|
├── Services/                   # API service definitions and protocols
│   └── APIService.swift
│   └── APIServiceProtocol.swift
│
|
├── Views/                      # SwiftUI Views for UI elements
│   ├── RecipeListView.swift
│   ├── RecipeRowView.swift
│   └── RecipeDetailView.swift
│
|
└── Resources/                  # Assets and resources
    └── Assets.xcassets


# How It Works
1 - RecipeListView:
    > Displays the list of recipes in a List view.
    > Users can search for specific recipes using the search bar.
    > Pull-to-refresh functionality is implemented to reload the recipe list.

2 - RecipeDetailView:
    > When a recipe is selected, users are navigated to the detail view.
    > Displays the recipe’s name, cuisine, and image.

3 - RecipeViewModel:
    > Fetches recipes from the API using APIService.
    > Handles the state: loading, success, error, or empty response.
    > Updates the RecipeListView with fresh data.

4 - APIService:
    > Makes network requests to fetch the list of recipes.
    > Uses URLSession to handle API calls.
