import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/provider/recipe_provider.dart';
import 'package:recipes_app/theme.dart';
import 'package:recipes_app/widget/card_ingredient.dart';
import 'package:recipes_app/widget/card_instructions.dart';
import 'package:recipes_app/widget/card_recipe.dart';

class DetailRecipe extends StatefulWidget {
  const DetailRecipe({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<DetailRecipe> createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    RecipesProvider recipesProvider = Provider.of<RecipesProvider>(context);

    List<String> mealType = widget.recipe.mealType;
    String label = mealType.length > 1
        ? mealType.join(' & ')
        : mealType.isNotEmpty
            ? mealType.first
            : 'Unknown';

    Widget header() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            widget.recipe.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: liteblueColor, // Warna gelap (mirip coklat)
              borderRadius: BorderRadius.circular(6), // Membuat bentuk kapsul
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: primaryColor, // Warna teks (oranye terang)
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    Widget headerLandscape() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.recipe.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: liteblueColor, // Warna gelap (mirip coklat)
                  borderRadius:
                      BorderRadius.circular(6), // Membuat bentuk kapsul
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: primaryColor, // Warna teks (oranye terang)
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recipe.name,
                style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text('Callorries : '),
                Image.asset(
                  'assets/icon_kkal.png',
                  height: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.recipe.calories.toString(),
                ),
              ]),
              const SizedBox(
                height: 4,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text('Cook Time : '),
                Image.asset(
                  'assets/icon_time.png',
                  height: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${widget.recipe.cookTimeMinutes}min',
                ),
              ]),
              const SizedBox(
                height: 4,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text('Difficulty : '),
                Image.asset(
                  'assets/icon_difficult.png',
                  height: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.recipe.difficulty,
                ),
              ]),
              const SizedBox(
                height: 4,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text('Rating : '),
                Image.asset(
                  'assets/star.png',
                  height: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.recipe.rating.toString(),
                ),
              ]),
            ],
          )
        ],
      );
    }

    Widget orientationPotrait() {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  header(),
                  // body
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.recipe.name,
                              style: blackTextStyle.copyWith(
                                  fontSize: 20, fontWeight: bold),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon_kkal.png',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.recipe.calories.toString(),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/icon_time.png',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '${widget.recipe.cookTimeMinutes}min',
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/icon_difficult.png',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.recipe.difficulty,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/star.png',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.recipe.rating.toString(),
                              ),
                            ],
                          ),
                        ),

                        // card ingredients
                        CardIngredient(recipe: widget.recipe),
                        // card instructions
                        CardInstructions(recipe: widget.recipe),

                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 20, right: 4),
            child: FloatingActionButton(
                backgroundColor: liteblueColor,
                shape: const CircleBorder(),
                onPressed: () {
                  recipesProvider.toggleBookmark(widget.recipe);
                  recipesProvider.isBookmarked(widget.recipe)
                      ? Fluttertoast.showToast(
                          msg: 'Recipe Was Added to Bookmark')
                      : Fluttertoast.showToast(
                          msg: 'Recipe Was Removed from Bookmark');
                },
                child: recipesProvider.isBookmarked(widget.recipe)
                    ? const Icon(
                        Icons.bookmark_added,
                        color: primaryColor,
                        size: 30,
                      )
                    : const Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                        size: 30,
                      )),
          ),
        ),
      );
    }

    Widget orientationLandscape() {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  headerLandscape(),
                  // body
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // card ingredients
                        Expanded(
                            flex: 2,
                            child: CardIngredient(recipe: widget.recipe)),
                        // card instructions
                        Expanded(
                            flex: 3,
                            child: CardInstructions(recipe: widget.recipe)),

                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 20, right: 4),
            child: FloatingActionButton(
                backgroundColor: liteblueColor,
                shape: const CircleBorder(),
                onPressed: () {
                  recipesProvider.toggleBookmark(widget.recipe);
                  recipesProvider.isBookmarked(widget.recipe)
                      ? Fluttertoast.showToast(
                          msg: 'Recipe Was Added to Bookmark')
                      : Fluttertoast.showToast(
                          msg: 'Recipe Was Removed from Bookmark');
                },
                child: recipesProvider.isBookmarked(widget.recipe)
                    ? const Icon(
                        Icons.bookmark_added,
                        color: primaryColor,
                        size: 30,
                      )
                    : const Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                        size: 30,
                      )),
          ),
        ),
      );
    }

    return orientation == Orientation.landscape
        ? orientationLandscape()
        : orientationPotrait();
  }
}
