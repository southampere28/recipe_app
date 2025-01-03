// ignore_for_file: public_member_api_docs, sort_constructors_first
class Recipe {
  String name;
  List<String> ingredients;
  List<String> instructions;
  int cookTimeMinutes;
  String difficulty;
  int calories;
  double rating;
  List<String> mealType;
  String image;
  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.cookTimeMinutes,
    required this.difficulty,
    required this.calories,
    required this.rating,
    required this.mealType,
    required this.image,
  });
}
