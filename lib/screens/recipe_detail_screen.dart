import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Recipe recipe =
        ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: CustomScrollView(
        slivers: [
          // AppBar com imagem
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Color(0xFFFF5B7F),
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, 
                  color: Color(0xFFFF5B7F), size: 18),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagem
                  Image.asset(
                    recipe.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Color(0xFFFFE5EC),
                        child: Icon(Icons.image_not_supported,
                            color: Colors.white70, size: 60),
                      );
                    },
                  ),
                  // Gradiente
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFFFF5B7F).withOpacity(0.3),
                          Color(0xFFFF5B7F),
                        ],
                      ),
                    ),
                  ),
                  // Favorito
                  Positioned(
                    top: 60,
                    right: 16,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Color(0xFFFF5B7F),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Conteúdo
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1F1F),
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 12),

                  // Info Cards (Tempo + Dificuldade)
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          icon: Icons.schedule,
                          label: 'Tempo',
                          value: recipe.prepTime,
                          iconBgColor: Color(0xFFE8F5E9),
                          iconColor: Color(0xFF4CAF50),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoCard(
                          icon: Icons.trending_up,
                          label: 'Dificuldade',
                          value: recipe.difficulty,
                          iconBgColor: Color(0xFFFFE0B2),
                          iconColor: Color(0xFFFFA726),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Descrição
                  Text(
                    'Sobre esta Receita',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F1F1F),
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    recipe.description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 28),

                  // Ingredientes
                  Text(
                    'Ingredientes (${recipe.ingredients.length})',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F1F1F),
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE5EC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: recipe.ingredients.map((ingredient) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF5B7F),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '✓',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    '${ingredient.quantity} ${ingredient.unit} de ${ingredient.name}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: Color(0xFF1F1F1F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),

                  // Modo de Preparo
                  Text(
                    'Modo de Preparo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F1F1F),
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: 12),
                  ...List.generate(recipe.steps.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF5B7F),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                recipe.steps[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.6,
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    );
                  }).toList(),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color iconBgColor,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFF5B7F).withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(icon, color: iconColor, size: 20),
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF999999),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1F1F),
            ),
          ),
        ],
      ),
    );
  }
}
