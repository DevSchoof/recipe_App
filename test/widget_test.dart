// Teste básico de widget do app DishDash.
//
// Verifica se a tela inicial (Splash) é exibida corretamente ao iniciar o app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_app/main.dart';

void main() {
  testWidgets('App inicia exibindo a Splash Screen do DishDash',
      (WidgetTester tester) async {
    // Constrói o app e dispara um frame.
    await tester.pumpWidget(const RecipeApp());

    // Verifica se o nome do app aparece na tela inicial.
    expect(find.text('DishDash'), findsOneWidget);
  });
}