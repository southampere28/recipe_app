import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/provider/recipe_provider.dart';
import 'package:recipes_app/theme.dart';
import 'package:recipes_app/widget/card_ingredient.dart';
import 'package:recipes_app/widget/card_instructions.dart';
import 'package:recipes_app/widget/header_widget.dart';
import 'package:recipes_app/widget/headerls_widget.dart';

class DetailRecipe extends StatefulWidget {
  const DetailRecipe({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<DetailRecipe> createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  final _commentController = TextEditingController();
  final List<Map<String, String>> _comments = <Map<String, String>>[];

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

      setState(() {
        _comments.add({
          'comment': _commentController.text,
          'date': formattedDate,
        });
        _commentController.clear();
      });
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

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

    Widget showComment() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            // Show comments
            Text(
              "Comments:",
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            const SizedBox(
              height: 8,
            ),
            _comments.isEmpty
                ? Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: liteblueColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'No comments yet, be the first to comment',
                        style: secondaryTextStyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Column(
                    children: _comments.map((comment) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: c4Color,
                                blurRadius: 1,
                                offset: Offset(1, 3),
                              ),
                            ],
                            color: liteblueColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            subtitle: Text(comment['date'] ?? '(No Date)'),
                            title: Text(comment['comment'] ?? '(No Comment)'),
                          ),
                        ),
                      );
                    }).toList(),
                  )
          ],
        ),
      );
    }

    Widget inputComment() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: "Add a comment",
                ),
                maxLines: null,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: _addComment,
            ),
          ],
        ),
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
                  Header(recipe: widget.recipe, label: label),
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
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  showComment(),
                  inputComment(),
                  const SizedBox(
                    height: 200,
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
                  HeaderLandscape(recipe: widget.recipe, label: label),
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
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  showComment(),
                  inputComment(),
                  const SizedBox(
                    height: 200,
                  )
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
