import 'package:flutter/material.dart';

class RecipeFormScreen extends StatefulWidget {
  @override
  State<RecipeFormScreen> createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _prepTimeController = TextEditingController();
  String _selectedDifficulty = 'Fácil';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _prepTimeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('=== NOVA RECEITA ===');
      print('Título: ${_titleController.text}');
      print('Descrição: ${_descriptionController.text}');
      print('Tempo: ${_prepTimeController.text} min');
      print('Dificuldade: $_selectedDifficulty');
      print('====================');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Receita "${_titleController.text}" adicionada! 🎉',
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

      _formKey.currentState!.reset();
      _titleController.clear();
      _descriptionController.clear();
      _prepTimeController.clear();
      setState(() => _selectedDifficulty = 'Fácil');

      Future.delayed(Duration(seconds: 2), () {
        if (mounted) Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Nova Receita',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F1F1F),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFFF5B7F), size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
                Text(
                  'Nome da Receita *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F1F1F),
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Ex: Bolo de Chocolate Delicioso',
                    prefixIcon: Icon(Icons.restaurant, color: Color(0xFFFF5B7F)),
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    filled: true,
                    fillColor: Colors.white,
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
                Text(
                  'Descrição *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F1F1F),
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Descreva a receita, ingredientes principais...',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Icon(Icons.description, color: Color(0xFFFF5B7F)),
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
                    contentPadding: EdgeInsets.all(14),
                    filled: true,
                    fillColor: Colors.white,
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

                // Campo: Tempo de Preparo
                Text(
                  'Tempo de Preparo (minutos) *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F1F1F),
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _prepTimeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '30',
                    prefixIcon: Icon(Icons.schedule, color: Color(0xFFFF5B7F)),
                    suffixText: 'min',
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    filled: true,
                    fillColor: Colors.white,
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
                Text(
                  'Nível de Dificuldade',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F1F1F),
                    letterSpacing: 0.2,
                  ),
                ),
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
}
