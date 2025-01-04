import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/theme.dart';

class CardIngredient extends StatelessWidget {
  const CardIngredient({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: whiteBone,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: primaryColor, blurRadius: 4, offset: Offset(2, 4))
          ]),
      child: Column(children: [
        Text(
          'Ingredients',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          thickness: 1,
          color: secondaryColor,
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recipe.ingredients.length,
          itemBuilder: (context, index) {
            String ingredient = recipe.ingredients[index];
            return Expanded(
              child: Text(
                "- $ingredient",
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ]),
    );
  }
}
