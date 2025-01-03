import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class RecipesProvider with ChangeNotifier {
  final List<Recipe> _recipeList = [
    Recipe(
        name: "Classic Margherita Pizza",
        ingredients: [
          "Pizza dough",
          "Tomato sauce",
          "Fresh mozzarella cheese",
          "Fresh basil leaves",
          "Olive oil",
          "Salt and pepper to taste"
        ],
        instructions: [
          "Preheat the oven to 475°F (245°C).",
          "Roll out the pizza dough and spread tomato sauce evenly.",
          "Top with slices of fresh mozzarella and fresh basil leaves.",
          "Drizzle with olive oil and season with salt and pepper.",
          "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
          "Slice and serve hot."
        ],
        cookTimeMinutes: 15,
        difficulty: "Easy",
        calories: 300,
        rating: 4.6,
        mealType: ["Dinner"],
        image: "https://cdn.dummyjson.com/recipe-images/1.webp"),
    Recipe(
        name: "Vegetarian Stir-Fry",
        ingredients: [
          "Tofu, cubed",
          "Broccoli florets",
          "Carrots, sliced",
          "Bell peppers, sliced",
          "Soy sauce",
          "Ginger, minced",
          "Garlic, minced",
          "Sesame oil",
          "Cooked rice for serving"
        ],
        instructions: [
          "In a wok, heat sesame oil over medium-high heat.",
          "Add minced ginger and garlic, sauté until fragrant.",
          "Add cubed tofu and stir-fry until golden brown.",
          "Add broccoli, carrots, and bell peppers. Cook until vegetables are tender-crisp.",
          "Pour soy sauce over the stir-fry and toss to combine.",
          "Serve over cooked rice."
        ],
        cookTimeMinutes: 20,
        difficulty: "Medium",
        calories: 250,
        rating: 4.7,
        mealType: ["Lunch"],
        image: "https://cdn.dummyjson.com/recipe-images/2.webp"),
    Recipe(
        name: "Chocolate Chip Cookies",
        ingredients: [
          "All-purpose flour",
          "Butter, softened",
          "Brown sugar",
          "White sugar",
          "Eggs",
          "Vanilla extract",
          "Baking soda",
          "Salt",
          "Chocolate chips"
        ],
        instructions: [
          "Preheat the oven to 350°F (175°C).",
          "In a bowl, cream together softened butter, brown sugar, and white sugar.",
          "Beat in eggs one at a time, then stir in vanilla extract.",
          "Combine flour, baking soda, and salt. Gradually add to the wet ingredients.",
          "Fold in chocolate chips.",
          "Drop rounded tablespoons of dough onto ungreased baking sheets.",
          "Bake for 10-12 minutes or until edges are golden brown.",
          "Allow cookies to cool on the baking sheet for a few minutes before transferring to a wire rack."
        ],
        cookTimeMinutes: 10,
        difficulty: "Easy",
        calories: 150,
        rating: 4.9,
        mealType: ["Snack", "Dessert"],
        image: "https://cdn.dummyjson.com/recipe-images/3.webp"),
  ];

  final List<Recipe> _bookmarkedRecipes = [];

  List<Recipe> get recipeList => _recipeList;

  List<Recipe> get bookmarkedRecipes => _bookmarkedRecipes;

  void toggleBookmark(Recipe recipe) {
    if (_bookmarkedRecipes.contains(recipe)) {
      _bookmarkedRecipes.remove(recipe);
    } else {
      _bookmarkedRecipes.add(recipe);
    }
    notifyListeners();
  }

  bool isBookmarked(Recipe recipe) {
    return _bookmarkedRecipes.contains(recipe);
  }
}
