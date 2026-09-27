import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../utils/constants.dart';
import '../widgets/recipe_card.dart';

class RecipesListScreen extends StatefulWidget {
  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  late List<Recipe> recipes;
  bool _isGridView = false;

  @override
  void initState() {
    super.initState();
    recipes = mockRecipes;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'DishDash',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF5B7F),
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false,
        actions: [
          if (!isMobile)
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButton(
                icon: Icon(
                  _isGridView ? Icons.view_list : Icons.view_module,
                  color: Color(0xFFFF5B7F),
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    _isGridView = !_isGridView;
                  });
                },
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header com buscador
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Saudação
                  Text(
                    'Olá! 👋',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F1F1F),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Explore nossas receitas deliciosas',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Buscador
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFF5B7F).withOpacity(0.08),
                          blurRadius: 12,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar receitas...',
                        hintStyle: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFFFF5B7F),
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1F1F1F),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Categorias (carousel horizontal)
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryChip('Todos', true),
                  SizedBox(width: 8),
                  _buildCategoryChip('Doces', false),
                  SizedBox(width: 8),
                  _buildCategoryChip('Salgados', false),
                  SizedBox(width: 8),
                  _buildCategoryChip('Bebidas', false),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Título da seção
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receitas Recomendadas',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F1F1F),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${recipes.length} receitas',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Lista/Grid de Receitas
            _buildRecipesList(context, isMobile),

            SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/form');
        },
        backgroundColor: Color(0xFFFF5B7F),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFF5B7F) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(
          color: Color(0xFFE0E0E0),
          width: 1,
        ),
        boxShadow: isSelected ? [
          BoxShadow(
            color: Color(0xFFFF5B7F).withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ] : [],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Color(0xFF666666),
        ),
      ),
    );
  }

  Widget _buildRecipesList(BuildContext context, bool isMobile) {
    // Mobile: ListView
    if (isMobile || !_isGridView) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              recipe: recipes[index],
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/detail',
                  arguments: recipes[index],
                );
              },
            );
          },
        ),
      );
    }

    // Tablet: GridView (2 colunas)
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            recipe: recipes[index],
            onTap: () {
              Navigator.of(context).pushNamed(
                '/detail',
                arguments: recipes[index],
              );
            },
          );
        },
      ),
    );
  }
}
