import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/pages/detail_recipe.dart';
import 'package:recipes_app/provider/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/theme.dart';
import 'package:recipes_app/widget/card_recipe.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;
    RecipesProvider recipesProvider = Provider.of<RecipesProvider>(context);

    double calculateCardWidth() {
      if (screenSize.width >= 1280) {
        return screenSize.width / 4 - 8;
      } else if (screenSize.width >= 1024) {
        return screenSize.width / 3 - 8;
      } else {
        return screenSize.width / 2 - 8;
      }
    }

    double calculateIpad() {
      if (screenSize.width >= 600) {
        return screenSize.width / 2 - 8;
      } else {
        return screenSize.width;
      }
    }

    return orientation == Orientation.landscape
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: recipesProvider.recipeList.map((recipe) {
                  return SizedBox(
                    width: calculateCardWidth(),
                    child: CardRecipe(recipe: recipe),
                  );
                }).toList(),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: recipesProvider.recipeList.map((recipe) {
                  return SizedBox(
                    width: calculateIpad(),
                    child: CardRecipe(recipe: recipe),
                  );
                }).toList(),
              ),
            ),
          );
  }
}
