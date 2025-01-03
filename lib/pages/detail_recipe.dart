import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/provider/recipe_provider.dart';

class DetailRecipe extends StatefulWidget {
  const DetailRecipe({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<DetailRecipe> createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  @override
  Widget build(BuildContext context) {
    RecipesProvider recipesProvider = Provider.of<RecipesProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Check Detail Homepage'),
            ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'nama resep ${widget.recipe.name}');
                },
                child: Text('Click Here')),
            Checkbox(
                value: recipesProvider.isBookmarked(widget.recipe),
                onChanged: (newBool) {
                  recipesProvider.toggleBookmark(widget.recipe);
                }),
          ],
        ),
      ),
    );
  }
}
