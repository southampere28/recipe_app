import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/pages/detail_recipe.dart';
import 'package:recipes_app/provider/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipesProvider recipesProvider = Provider.of<RecipesProvider>(context);

    return ListView(
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

            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailRecipe(recipe: recipe))),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primaryColor, width: 1),
                  color: liteblueColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            maxLines: 2,
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('rating :${recipe.rating}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                      Icons.local_fire_department_outlined),
                                  Text(
                                    recipe.calories.toString(),
                                  ),
                                  Container(
                                    height: 2,
                                    width: 2,
                                    color: Colors.black,
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Text(
                                recipe.cookTimeMinutes.toString(),
                              )),
                              Expanded(
                                  child: Text(
                                recipe.difficulty,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        recipe.image,
                        height: 60,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return SizedBox(
                            height: 60,
                            width: 60,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
