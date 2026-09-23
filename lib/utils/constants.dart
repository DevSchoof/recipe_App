// lib/utils/constants.dart
final List<Recipe> mockRecipes = [
  Recipe(
    id: 1,
    title: 'Bolo de Chocolate',
    description: 'Um delicioso bolo de chocolate caseiro',
    imageUrl: 'assets/images/chocolate_cake.jpg',
    ingredients: [
      Ingredient(name: 'Farinha', quantity: '2', unit: 'xícaras'),
      Ingredient(name: 'Chocolate em pó', quantity: '200', unit: 'gramas'),
    ],
    steps: ['Misture ingredientes...', 'Despeje na forma...', 'Asse por 30 min'],
    prepTime: '50 min',
    difficulty: 'Médio',
  ),
  // ... adicione mais receitas
];