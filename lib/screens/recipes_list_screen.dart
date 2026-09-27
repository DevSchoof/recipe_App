import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../utils/constants.dart';
import '../widgets/custom_app.dart';
import '../widgets/recipe_card.dart';

class RecipesListScreen extends StatefulWidget {
  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  bool _isGridView = false;
  String _selectedCategory = 'Todos';
  String _searchQuery = '';
  final Set<int> _favoriteIds = {};
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Recipe> get _filteredRecipes {
    return mockRecipes.where((recipe) {
      final matchesCategory =
          _selectedCategory == 'Todos' || recipe.category == _selectedCategory;
      final matchesSearch = recipe.title
          .toLowerCase()
          .contains(_searchQuery.trim().toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  Future<void> _openForm() async {
    final result = await Navigator.of(context).pushNamed('/form');
    // Se uma nova receita foi criada no formulário, atualiza a listagem.
    if (result != null) {
      setState(() {});
    }
  }

  void _toggleFavorite(int recipeId) {
    setState(() {
      if (_favoriteIds.contains(recipeId)) {
        _favoriteIds.remove(recipeId);
      } else {
        _favoriteIds.add(recipeId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final filteredRecipes = _filteredRecipes;

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
        title: 'DishDash',
        titleColor: Color(0xFFFF5B7F),
        showBackButton: false,
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
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
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
                        suffixIcon: _searchQuery.isEmpty
                            ? null
                            : IconButton(
                                icon: Icon(Icons.close,
                                    color: Color(0xFFCCCCCC), size: 18),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchQuery = '';
                                  });
                                },
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
                children: recipeCategories.map((category) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: _buildCategoryChip(
                      category,
                      _selectedCategory == category,
                    ),
                  );
                }).toList(),
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
                        _selectedCategory == 'Todos'
                            ? 'Receitas Recomendadas'
                            : _selectedCategory,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F1F1F),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${filteredRecipes.length} receita${filteredRecipes.length == 1 ? '' : 's'}',
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
            filteredRecipes.isEmpty
                ? _buildEmptyState()
                : _buildRecipesList(context, isMobile, filteredRecipes),

            SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openForm,
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

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.search_off, size: 56, color: Color(0xFFCCCCCC)),
            SizedBox(height: 12),
            Text(
              'Nenhuma receita encontrada',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF666666),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Tente buscar por outro termo ou categoria',
              style: TextStyle(fontSize: 13, color: Color(0xFF999999)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFF5B7F) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(
                  color: Color(0xFFE0E0E0),
                  width: 1,
                ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color(0xFFFF5B7F).withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Color(0xFF666666),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipesList(
      BuildContext context, bool isMobile, List<Recipe> recipes) {
    // Mobile: ListView
    if (isMobile || !_isGridView) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipeCard(
              recipe: recipe,
              isFavorite: _favoriteIds.contains(recipe.id),
              onFavoriteTap: () => _toggleFavorite(recipe.id),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/detail',
                  arguments: recipe,
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
          final recipe = recipes[index];
          return RecipeCard(
            recipe: recipe,
            isFavorite: _favoriteIds.contains(recipe.id),
            onFavoriteTap: () => _toggleFavorite(recipe.id),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/detail',
                arguments: recipe,
              );
            },
          );
        },
      ),
    );
  }
}