import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/theme.dart';

class CardInstructions extends StatelessWidget {
  const CardInstructions({super.key, required this.recipe});

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
          'Instructions',
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
          itemCount: recipe.instructions.length,
          itemBuilder: (context, index) {
            String instruction = recipe.instructions[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${(index + 1)}.'),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    instruction,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  ),
                ),
              ],
            );
          },
        ),
      ]),
    );
  }
}
