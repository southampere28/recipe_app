import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/theme.dart';

class HeaderLandscape extends StatelessWidget {
  const HeaderLandscape({super.key, required this.recipe, required this.label});

  final Recipe recipe;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                recipe.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: liteblueColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: primaryColor,
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
              recipe.name,
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
                recipe.calories.toString(),
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
                '${recipe.cookTimeMinutes}min',
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
                recipe.difficulty,
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
                recipe.rating.toString(),
              ),
            ]),
          ],
        )
      ],
    );
  }
}
