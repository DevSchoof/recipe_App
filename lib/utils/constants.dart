// lib/utils/constants.dart
import 'package:recipe_app/models/recipe_model.dart' hide Recipe;

import '../models/ingredient_model.dart' hide Recipe;
import '../models/recipe_model.dart';

// Lista de categorias usadas nos chips de filtro da tela de listagem.
const List<String> recipeCategories = ['Todos', 'Doces', 'Salgados', 'Bebidas'];

// Lista mutável (não é preciso persistência de dados no projeto, mas
// mantemos em memória para que novas receitas criadas no formulário
// apareçam na listagem durante a sessão do app).
List<Recipe> mockRecipes = [
  Recipe(
    id: 1,
    title: 'Bolo de Chocolate',
    description:
        'Um delicioso bolo de chocolate caseiro, fofinho e com cobertura cremosa. Perfeito para o café da tarde.',
    imageUrl: 'https://media.istockphoto.com/id/1312502806/pt/foto/chocolate-cake.jpg?s=612x612&w=is&k=20&c=8fpRfouOieJl1uAtgSU70nKDzfMrayL-JsVfZyxhLFU=',
    category: 'Doces',
    ingredients: [
      Ingredient(name: 'Farinha de trigo', quantity: '2', unit: 'xícaras'),
      Ingredient(name: 'Chocolate em pó', quantity: '200', unit: 'gramas'),
      Ingredient(name: 'Ovos', quantity: '3', unit: 'unidades'),
      Ingredient(name: 'Açúcar', quantity: '1', unit: 'xícara'),
      Ingredient(name: 'Leite', quantity: '1', unit: 'xícara'),
    ],
    steps: [
      'Misture os ingredientes secos em uma tigela.',
      'Adicione os ovos e o leite, misturando bem.',
      'Despeje a massa em uma forma untada.',
      'Asse em forno pré-aquecido a 180°C por 40 minutos.',
      'Deixe esfriar antes de desenformar e cubra a gosto.',
    ],
    prepTime: '50 min',
    difficulty: 'Médio',
  ),
  Recipe(
    id: 2,
    title: 'Brigadeiro Gourmet',
    description:
        'O clássico doce brasileiro, cremoso por dentro e enrolado em granulado belga.',
    imageUrl: 'https://media.istockphoto.com/id/1227583469/pt/foto/sweet-indulgence.jpg?s=612x612&w=is&k=20&c=jM8IBOqt580uCYUTxHX3o2uv9qyZaEVushxLLJUbexo=',
    category: 'Doces',
    ingredients: [
      Ingredient(name: 'Leite condensado', quantity: '1', unit: 'lata'),
      Ingredient(name: 'Chocolate em pó', quantity: '3', unit: 'colheres'),
      Ingredient(name: 'Manteiga', quantity: '1', unit: 'colher'),
      Ingredient(name: 'Granulado', quantity: '100', unit: 'gramas'),
    ],
    steps: [
      'Leve o leite condensado, o chocolate e a manteiga ao fogo baixo.',
      'Mexa sem parar até desgrudar do fundo da panela.',
      'Deixe esfriar e enrole em bolinhas.',
      'Passe no granulado.',
    ],
    prepTime: '30 min',
    difficulty: 'Fácil',
  ),
  Recipe(
    id: 3,
    title: 'Pudim de Leite',
    description:
        'Sobremesa clássica, cremosa, com calda de caramelo dourada.',
    imageUrl: 'https://images.unsplash.com/photo-1702728052103-69473aa7ed77?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    category: 'Doces',
    ingredients: [
      Ingredient(name: 'Leite condensado', quantity: '1', unit: 'lata'),
      Ingredient(name: 'Leite', quantity: '1', unit: 'lata (medida)'),
      Ingredient(name: 'Ovos', quantity: '3', unit: 'unidades'),
      Ingredient(name: 'Açúcar', quantity: '1', unit: 'xícara'),
    ],
    steps: [
      'Prepare uma calda de caramelo com o açúcar e forre a forma.',
      'Bata o leite condensado, o leite e os ovos no liquidificador.',
      'Despeje na forma caramelizada.',
      'Asse em banho-maria por 50 minutos.',
      'Leve à geladeira antes de desenformar.',
    ],
    prepTime: '70 min',
    difficulty: 'Médio',
  ),
  Recipe(
    id: 4,
    title: 'Feijoada Completa',
    description:
        'Prato típico brasileiro com feijão preto, carnes e acompanhamentos tradicionais.',
    imageUrl: 'https://media.istockphoto.com/id/899497396/pt/foto/delicious-brazilian-feijoada.jpg?s=612x612&w=is&k=20&c=pXeYu_DWY-IVEqs51NYNjaVo9-yA2PlDkeclejmT4IU=',
    category: 'Salgados',
    ingredients: [
      Ingredient(name: 'Feijão preto', quantity: '500', unit: 'gramas'),
      Ingredient(name: 'Carne seca', quantity: '300', unit: 'gramas'),
      Ingredient(name: 'Linguiça calabresa', quantity: '200', unit: 'gramas'),
      Ingredient(name: 'Bacon', quantity: '150', unit: 'gramas'),
      Ingredient(name: 'Cebola', quantity: '1', unit: 'unidade'),
      Ingredient(name: 'Alho', quantity: '3', unit: 'dentes'),
    ],
    steps: [
      'Deixe o feijão e a carne seca de molho na véspera.',
      'Cozinhe o feijão até ficar macio.',
      'Refogue as carnes com alho e cebola.',
      'Junte tudo e cozinhe em fogo baixo por 1 hora.',
      'Sirva com arroz, couve e farofa.',
    ],
    prepTime: '120 min',
    difficulty: 'Difícil',
  ),
  Recipe(
    id: 5,
    title: 'Coxinha de Frango',
    description:
        'Salgadinho clássico brasileiro, crocante por fora e cremoso por dentro.',
    imageUrl: 'https://media.istockphoto.com/id/1358848345/pt/foto/traditional-fried-coxinha-on-a-black-plate-on-a-slate-background-brazilian-snack.jpg?s=612x612&w=is&k=20&c=P_qH1jb2lcLQRm9jrszpgbO_YDF68hMkHlJBI1OfJc4=',
    category: 'Salgados',
    ingredients: [
      Ingredient(name: 'Frango desfiado', quantity: '300', unit: 'gramas'),
      Ingredient(name: 'Farinha de trigo', quantity: '2', unit: 'xícaras'),
      Ingredient(name: 'Caldo de galinha', quantity: '500', unit: 'ml'),
      Ingredient(name: 'Farinha de rosca', quantity: '1', unit: 'xícara'),
      Ingredient(name: 'Ovos', quantity: '2', unit: 'unidades'),
    ],
    steps: [
      'Prepare a massa cozinhando a farinha no caldo até desgrudar da panela.',
      'Recheie porções da massa com o frango desfiado e molde em formato de gota.',
      'Passe no ovo batido e depois na farinha de rosca.',
      'Frite em óleo quente até dourar.',
    ],
    prepTime: '60 min',
    difficulty: 'Difícil',
  ),
  Recipe(
    id: 6,
    title: 'Pão de Queijo',
    description:
        'Quitute mineiro, macio por dentro e levemente crocante por fora.',
    imageUrl: 'https://media.istockphoto.com/id/1286193563/pt/foto/brazilian-cheese-buns-table-coffee-in-the-morning-with-cheese-bread-in-basket.jpg?s=1024x1024&w=is&k=20&c=xic7WgzYeN3Zt-yf2q64NuYrSDA1h-Dm9g0zL6cgSSU=',
    category: 'Salgados',
    ingredients: [
      Ingredient(name: 'Polvilho azedo', quantity: '500', unit: 'gramas'),
      Ingredient(name: 'Queijo minas ralado', quantity: '300', unit: 'gramas'),
      Ingredient(name: 'Leite', quantity: '250', unit: 'ml'),
      Ingredient(name: 'Óleo', quantity: '150', unit: 'ml'),
      Ingredient(name: 'Ovos', quantity: '2', unit: 'unidades'),
    ],
    steps: [
      'Ferva o leite com o óleo e escalde o polvilho.',
      'Deixe esfriar um pouco e adicione os ovos e o queijo.',
      'Sove até obter uma massa homogênea.',
      'Molde bolinhas e asse a 180°C por 25 minutos.',
    ],
    prepTime: '45 min',
    difficulty: 'Médio',
  ),
  Recipe(
    id: 7,
    title: 'Suco Detox Verde',
    description:
        'Bebida refrescante e nutritiva à base de couve, maçã e limão.',
    imageUrl: 'https://media.istockphoto.com/id/477310719/pt/foto/batido-de-espinafre.jpg?s=612x612&w=is&k=20&c=8SgRGqsm4RtlmmKFGoYdTdEcQfxXnsFCKpf_AyTAmLk=',
    category: 'Bebidas',
    ingredients: [
      Ingredient(name: 'Couve', quantity: '3', unit: 'folhas'),
      Ingredient(name: 'Maçã', quantity: '1', unit: 'unidade'),
      Ingredient(name: 'Limão', quantity: '1', unit: 'unidade'),
      Ingredient(name: 'Água de coco', quantity: '300', unit: 'ml'),
    ],
    steps: [
      'Lave bem a couve e a maçã.',
      'Bata tudo no liquidificador com a água de coco.',
      'Coe se preferir uma textura mais leve.',
      'Sirva gelado.',
    ],
    prepTime: '10 min',
    difficulty: 'Fácil',
  ),
  Recipe(
    id: 8,
    title: 'Vitamina de Frutas',
    description:
        'Bebida cremosa e nutritiva, ótima opção para o café da manhã.',
    imageUrl: 'https://media.istockphoto.com/id/654357990/pt/foto/healthy-fruit-and-vegetable-smoothies.jpg?s=612x612&w=is&k=20&c=AxaH1prCmZZjhtGo-61oQz-2IOV_8VXOWAen4N2m4ew=',
    category: 'Bebidas',
    ingredients: [
      Ingredient(name: 'Banana', quantity: '2', unit: 'unidades'),
      Ingredient(name: 'Morango', quantity: '6', unit: 'unidades'),
      Ingredient(name: 'Leite', quantity: '300', unit: 'ml'),
      Ingredient(name: 'Mel', quantity: '1', unit: 'colher'),
    ],
    steps: [
      'Coloque todos os ingredientes no liquidificador.',
      'Bata até ficar homogêneo.',
      'Sirva gelado, com ou sem gelo.',
    ],
    prepTime: '5 min',
    difficulty: 'Fácil',
  ),
];