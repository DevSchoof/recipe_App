import 'package:flutter/material.dart';
import '../models/ingredient_model.dart';
import '../models/recipe_model.dart';
import '../utils/constants.dart';
import '../widgets/custom_app.dart';

class RecipeFormScreen extends StatefulWidget {
  @override
  State<RecipeFormScreen> createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _prepTimeController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();
  String _selectedDifficulty = 'Fácil';
  String _selectedCategory = 'Doces';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _prepTimeController.dispose();
    _ingredientsController.dispose();
    _stepsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Cada linha do campo de ingredientes vira um Ingredient.
      final ingredientLines = _ingredientsController.text
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList();
      final ingredients = ingredientLines
          .map((line) => Ingredient(name: line, quantity: '', unit: ''))
          .toList();

      // Cada linha do campo de modo de preparo vira um passo.
      final steps = _stepsController.text
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList();

      final newRecipe = Recipe(
        id: DateTime.now().millisecondsSinceEpoch,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        imageUrl:
            'https://loremflickr.com/800/600/food,${Uri.encodeComponent(_selectedCategory)}',
        category: _selectedCategory,
        ingredients: ingredients,
        steps: steps,
        prepTime: '${_prepTimeController.text.trim()} min',
        difficulty: _selectedDifficulty,
      );

      // Adiciona a nova receita à lista compartilhada (em memória,
      // sem persistência entre execuções do app, conforme o escopo do projeto).
      mockRecipes.add(newRecipe);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Receita "${newRecipe.title}" adicionada! 🎉',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFF4CAF50),
          duration: Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
        ),
      );

      Future.delayed(Duration(seconds: 1), () {
        if (mounted) Navigator.of(context).pop(newRecipe);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(title: 'Nova Receita'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ícone decorativo
                Center(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE5EC),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.add_circle,
                      size: 48,
                      color: Color(0xFFFF5B7F),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Campo: Título
                _buildLabel('Nome da Receita *'),
                SizedBox(height: 8),
                TextFormField(
                  controller: _titleController,
                  decoration: _inputDecoration(
                    hint: 'Ex: Bolo de Chocolate Delicioso',
                    icon: Icons.restaurant,
                  ),
                  style: TextStyle(fontSize: 14, color: Color(0xFF1F1F1F)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O título é obrigatório';
                    }
                    if (value.length < 3) {
                      return 'Mínimo 3 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo: Descrição
                _buildLabel('Descrição *'),
                SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: _inputDecoration(
                    hint: 'Descreva a receita, ingredientes principais...',
                    icon: Icons.description,
                    alignIconTop: true,
                  ),
                  style: TextStyle(fontSize: 14, color: Color(0xFF1F1F1F)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A descrição é obrigatória';
                    }
                    if (value.length < 10) {
                      return 'Mínimo 10 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo: Categoria
                _buildLabel('Categoria'),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE0E0E0), width: 1),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedCategory,
                    underline: SizedBox(),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    icon: Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.expand_more, color: Color(0xFFFF5B7F)),
                    ),
                    items: ['Doces', 'Salgados', 'Bebidas'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _selectedCategory = newValue);
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Campo: Tempo de Preparo
                _buildLabel('Tempo de Preparo (minutos) *'),
                SizedBox(height: 8),
                TextFormField(
                  controller: _prepTimeController,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration(
                    hint: '30',
                    icon: Icons.schedule,
                    suffixText: 'min',
                  ),
                  style: TextStyle(fontSize: 14, color: Color(0xFF1F1F1F)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tempo obrigatório';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Deve ser um número';
                    }
                    if (int.parse(value) <= 0) {
                      return 'Deve ser maior que 0';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo: Dificuldade
                _buildLabel('Nível de Dificuldade'),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE0E0E0), width: 1),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedDifficulty,
                    underline: SizedBox(),
                    icon: Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.expand_more, color: Color(0xFFFF5B7F)),
                    ),
                    items: ['Fácil', 'Médio', 'Difícil'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: value == 'Fácil'
                                      ? Color(0xFF4CAF50)
                                      : value == 'Médio'
                                          ? Color(0xFFFFA726)
                                          : Color(0xFFFF5B7F),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                value,
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _selectedDifficulty = newValue);
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Campo: Ingredientes
                _buildLabel('Ingredientes * (um por linha)'),
                SizedBox(height: 8),
                TextFormField(
                  controller: _ingredientsController,
                  maxLines: 4,
                  decoration: _inputDecoration(
                    hint: 'Ex: 2 xícaras de farinha\n3 ovos\n1 lata de leite condensado',
                    icon: Icons.shopping_bag_outlined,
                    alignIconTop: true,
                  ),
                  style: TextStyle(fontSize: 14, color: Color(0xFF1F1F1F)),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe pelo menos um ingrediente';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo: Modo de Preparo
                _buildLabel('Modo de Preparo * (um passo por linha)'),
                SizedBox(height: 8),
                TextFormField(
                  controller: _stepsController,
                  maxLines: 4,
                  decoration: _inputDecoration(
                    hint: 'Ex: Misture os ingredientes secos\nAsse por 40 minutos',
                    icon: Icons.format_list_numbered,
                    alignIconTop: true,
                  ),
                  style: TextStyle(fontSize: 14, color: Color(0xFF1F1F1F)),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe pelo menos um passo do preparo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),

                // Botão Adicionar
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF5B7F),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Adicionar Receita',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),

                // Botão Cancelar
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFFFF5B7F),
                    side: BorderSide(color: Color(0xFFFF5B7F), width: 1.5),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1F1F1F),
        letterSpacing: 0.2,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    bool alignIconTop = false,
    String? suffixText,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(fontSize: 13, color: Color(0xFFCCCCCC)),
      prefixIcon: alignIconTop
          ? Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Icon(icon, color: Color(0xFFFF5B7F)),
            )
          : Icon(icon, color: Color(0xFFFF5B7F)),
      suffixText: suffixText,
      suffixStyle: TextStyle(
        fontSize: 12,
        color: Color(0xFF999999),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFFF5B7F), width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.redAccent, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
