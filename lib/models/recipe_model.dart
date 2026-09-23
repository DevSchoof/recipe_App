class Recipe {
  final int id;
  final String title;
  final String description;
  final String imageUrl; // URL ou asset de imagem
  final List<Ingredient> ingredients;
  final List<String> steps; // Modo de preparo
  final String prepTime; // ex: "30 min"
  final String difficulty; // ex: "Fácil"

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.prepTime,
    required this.difficulty,
  });
}