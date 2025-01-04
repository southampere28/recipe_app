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
    RecipesProvider recipesProvider = Provider.of<RecipesProvider>(context);

    return orientation == Orientation.landscape
        ? GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 1, // Ubah sesuai desain Anda
            ),
            itemCount: recipesProvider.recipeList.length,
            itemBuilder: (context, index) {
              Recipe recipe = recipesProvider.recipeList[index];
              return CardRecipe(recipe: recipe);
            },
          )
        : ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipesProvider.recipeList.length,
                itemBuilder: (context, index) {
                  Recipe recipe = recipesProvider.recipeList[index];

                  return CardRecipe(recipe: recipe);
                },
              )
            ],
          );
  }
}
