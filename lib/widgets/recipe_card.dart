import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import 'recipe_image.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.onTap,
    this.isFavorite = false,
    this.onFavoriteTap,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.97).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFF5B7F).withOpacity(0.12),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem com overlay
                Stack(
                  children: [
                    // Imagem
                    RecipeImage(
                      imageUrl: widget.recipe.imageUrl,
                      height: 180,
                      width: double.infinity,
                    ),

                    // Overlay gradient
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black12,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Badge de dificuldade (canto superior direito)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: _buildDifficultyBadge(widget.recipe.difficulty),
                    ),

                    // Ícone de favorito (canto superior esquerdo)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: GestureDetector(
                        onTap: widget.onFavoriteTap,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Color(0xFFFF5B7F),
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Conteúdo
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título
                      Text(
                        widget.recipe.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F1F1F),
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),

                      // Descrição
                      Text(
                        widget.recipe.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF999999),
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),

                      // Footer com informações
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Tempo de preparo
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 14,
                                color: Color(0xFFFF5B7F),
                              ),
                              SizedBox(width: 6),
                              Text(
                                widget.recipe.prepTime,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          // Quantidade de ingredientes
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                size: 14,
                                color: Color(0xFFFF5B7F),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '${widget.recipe.ingredients.length}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          // Ícone de seta
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Color(0xFFFF5B7F),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyBadge(String difficulty) {
    Color bgColor;
    Color textColor = Colors.white;
    String label = difficulty;

    switch (difficulty.toLowerCase()) {
      case 'fácil':
        bgColor = Color(0xFF4CAF50);
        break;
      case 'médio':
        bgColor = Color(0xFFFFA726);
        break;
      case 'difícil':
        bgColor = Color(0xFFFF5B7F);
        break;
      default:
        bgColor = Color(0xFF999999);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.4),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: textColor,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}