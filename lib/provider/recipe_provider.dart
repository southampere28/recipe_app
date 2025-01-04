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
    Recipe(
        name: "Chicken Alfredo Pasta",
        ingredients: [
        "Fettuccine pasta",
        "Chicken breast, sliced",
        "Heavy cream",
        "Parmesan cheese, grated",
        "Garlic, minced",
        "Butter",
        "Salt and pepper to taste",
        "Fresh parsley for garnish"
    ],
        instructions: [
        "Cook fettuccine pasta according to package instructions.",
        "In a pan, sauté sliced chicken in butter until fully cooked.",
        "Add minced garlic and cook until fragrant.",
        "Pour in heavy cream and grated Parmesan cheese. Stir until the cheese is melted.",
        "Season with salt and pepper to taste.",
        "Combine the Alfredo sauce with cooked pasta.",
        "Garnish with fresh parsley before serving."
    ],
        cookTimeMinutes: 20,
        difficulty: "Medium",
        calories: 500,
        rating: 4.9,
        mealType: ["Lunch", "Dinner"],
        image: "https://cdn.dummyjson.com/recipe-images/4.webp"),
    Recipe(
        name: "Mango Salsa Chicken",
        ingredients: [
        "Chicken thighs",
        "Mango, diced",
        "Red onion, finely chopped",
        "Cilantro, chopped",
        "Lime juice",
        "Jalapeño, minced",
        "Salt and pepper to taste",
        "Cooked rice for serving"
    ],
        instructions: [
        "Season chicken thighs with salt and pepper.",
        "Grill or bake chicken until fully cooked.",
        "In a bowl, combine diced mango, chopped red onion, cilantro, minced jalapeño, and lime juice.",
        "Dice the cooked chicken and mix it with the mango salsa.",
        "Serve over cooked rice."
    ],
        cookTimeMinutes: 25,
        difficulty: "Medium",
        calories: 380,
        rating: 4.9,
        mealType: ["Dinner"],
        image: "https://cdn.dummyjson.com/recipe-images/5.webp"),
    Recipe(
        name: "Quinoa Salad with Avocado",
        ingredients: [
        "Quinoa, cooked",
        "Avocado, diced",
        "Cherry tomatoes, halved",
        "Cucumber, diced",
        "Red bell pepper, diced",
        "Feta cheese, crumbled",
        "Lemon vinaigrette dressing",
        "Salt and pepper to taste"
    ],
        instructions: [
        "In a large bowl, combine cooked quinoa, diced avocado, halved cherry tomatoes, diced cucumber, diced red bell pepper, and crumbled feta cheese.",
        "Drizzle with lemon vinaigrette dressing and toss to combine.",
        "Season with salt and pepper to taste.",
        "Chill in the refrigerator before serving."
    ],
        cookTimeMinutes: 15,
        difficulty: "Easy",
        calories: 280,
        rating: 4.4,
        mealType: [
        "Lunch",
        "Side Dish"
    ],
        image: "https://cdn.dummyjson.com/recipe-images/6.webp"),
    Recipe(
        name: "Tomato Basil Bruschetta",
        ingredients: [
        "Baguette, sliced",
        "Tomatoes, diced",
        "Fresh basil, chopped",
        "Garlic cloves, minced",
        "Balsamic glaze",
        "Olive oil",
        "Salt and pepper to taste"
    ],
        instructions: [
        "Preheat the oven to 375°F (190°C).",
        "Place baguette slices on a baking sheet and toast in the oven until golden brown.",
        "In a bowl, combine diced tomatoes, chopped fresh basil, minced garlic, and a drizzle of olive oil.",
        "Season with salt and pepper to taste.",
        "Top each toasted baguette slice with the tomato-basil mixture.",
        "Drizzle with balsamic glaze before serving."
    ],
        cookTimeMinutes: 10,
        difficulty: "Easy",
        calories: 120,
        rating: 4.7,
        mealType: [
        "Appetizer"
    ],
        image: "https://cdn.dummyjson.com/recipe-images/7.webp"),
    Recipe(
        name: "Beef and Broccoli Stir-Fry",
        ingredients: [
        "Beef sirloin, thinly sliced",
        "Broccoli florets",
        "Soy sauce",
        "Oyster sauce",
        "Sesame oil",
        "Garlic, minced",
        "Ginger, minced",
        "Cornstarch",
        "Cooked white rice for serving"
    ],
        instructions: [
        "In a bowl, mix soy sauce, oyster sauce, sesame oil, and cornstarch to create the sauce.",
        "In a wok, stir-fry thinly sliced beef until browned. Remove from the wok.",
        "Stir-fry broccoli florets, minced garlic, and minced ginger in the same wok.",
        "Add the cooked beef back to the wok and pour the sauce over the mixture.",
        "Stir until everything is coated and heated through.",
        "Serve over cooked white rice."
    ],
        cookTimeMinutes: 15,
        difficulty: "Medium",
        calories: 380,
        rating: 4.7,
        mealType: [
        "Dinner"
    ],
        image: "https://cdn.dummyjson.com/recipe-images/8.webp"),
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
