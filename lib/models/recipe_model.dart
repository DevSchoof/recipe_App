import 'ingredient_model.dart';

class Recipe {
  final int id;
  final String title;
  final String description;
  final String imageUrl; // URL (http) ou asset de imagem
  final String category; // ex: "Doces", "Salgados", "Bebidas"
  final List<Ingredient> ingredients;
  final List<String> steps; // Modo de preparo
  final String prepTime; // ex: "30 min"
  final String difficulty; // ex: "Fácil"

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.ingredients,
    required this.steps,
    required this.prepTime,
    required this.difficulty,
  });
}