import 'package:flutter/material.dart';

/// Widget reutilizável para exibir a imagem de uma receita.
///
/// Aceita tanto URLs de rede (http/https) quanto caminhos de asset local.
/// Caso a imagem não carregue (sem internet, asset ausente etc.), exibe
/// um fallback visual consistente com o design (ícone rosa sobre fundo
/// rosa claro), evitando que o app quebre ou fique com espaço em branco.
class RecipeImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;

  const RecipeImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  bool get _isNetwork =>
      imageUrl.startsWith('http://') || imageUrl.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return _placeholder(loading: true);
        },
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }

    return Image.asset(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _placeholder(),
    );
  }

  Widget _placeholder({bool loading = false}) {
    return Container(
      height: height,
      width: width,
      color: const Color(0xFFFFE5EC),
      child: Center(
        child: loading
            ? const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF5B7F)),
                ),
              )
            : const Icon(
                Icons.restaurant,
                color: Color(0xFFFF5B7F),
                size: 48,
              ),
      ),
    );
  }
}