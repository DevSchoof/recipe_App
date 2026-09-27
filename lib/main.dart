import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/recipes_list_screen.dart';
import 'screens/recipe_form_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DishDash',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      // Tela inicial
      home: SplashScreen(),
      // Definir rotas nomeadas
      routes: {
        '/home': (context) => RecipesListScreen(),
        '/form': (context) => RecipeFormScreen(),
        '/detail': (context) => RecipeDetailScreen(),
      },
      // Tratamento de rotas não encontradas
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Página não encontrada'),
            ),
            body: Center(
              child: Text('Rota desconhecida: ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}