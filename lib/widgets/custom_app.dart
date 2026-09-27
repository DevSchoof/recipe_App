import 'package:flutter/material.dart';

/// AppBar reutilizável com o padrão visual do DishDash: fundo branco,
/// sem elevação, cantos inferiores arredondados e botão de voltar
/// estilizado em rosa. Usado nas telas que precisam de um cabeçalho
/// simples (ex: formulário de nova receita).
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Color titleColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.centerTitle = false,
    this.showBackButton = true,
    this.onBackPressed,
    this.actions,
    this.titleColor = const Color(0xFF1F1F1F),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: centerTitle,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: titleColor,
            letterSpacing: 0.3,
          ),
        ),
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Color(0xFFFF5B7F), size: 20),
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              )
            : null,
        automaticallyImplyLeading: showBackButton,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}