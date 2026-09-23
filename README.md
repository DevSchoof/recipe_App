# 🍳 Recipe App

Um aplicativo mobile moderno para gerenciar e descobrir receitas, desenvolvido em Flutter como projeto acadêmico do IFSP.

**👥 Desenvolvedores:** Eduardo e Aquila  
**📅 Apresentação:** 28 de setembro de 2026  
**🏫 Campus:** IFSP Bragança Paulista

---

## ✨ Funcionalidades

### 📱 Interface Intuitiva

- **🎨 Tela de Splash** - Apresentação visual atraente
- **📋 Lista de Receitas** - Browse com cards customizados  
- **➕ Nova Receita** - Formulário com validação
- **🔍 Detalhes Completos** - Ingredientes e modo de preparo

### 🎨 Design Moderno

- **🎯 Paleta de Cores** - Roxo personalizado (#6D28D9)
- **✍️ Tipografia Clara** - Consistente e legível
- **📱 Responsivo** - Para qualquer dispositivo
- **🛠️ Material Design 3** - Componentes profissionais

### 🔧 Arquitetura Sólida

- ✅ Estrutura em camadas (models, screens, widgets, utils)
- ✅ Navegação inteligente com Navigator
- ✅ Passagem de dados entre componentes  
- ✅ Tema centralizado e reutilizável

---

## 🚀 Como Começar

### Pré-requisitos

```
✓ Flutter 3.x ou superior
✓ Dart SDK
✓ Android SDK (para emulador)
✓ Git
```

### Instalação Rápida

```bash
# 1️⃣ Clonar o repositório
git clone https://github.com/eduardo/recipe-app.git
cd recipe-app

# 2️⃣ Instalar dependências
flutter pub get

# 3️⃣ Executar
flutter run
```

---

## 📊 Status de Desenvolvimento

**Progresso:** 3/8 fases concluídas (37.5%)

| Fase | Componente | Status | Responsável |
|------|-----------|--------|------------|
| 1️⃣ | Setup e Estrutura | ✅ Concluído | Ambos |
| 2️⃣ | Modelos de Dados | ✅ Concluído | Aquila |
| 3️⃣ | Tema e Utilitários | ✅ Concluído | Aquila |
| 4️⃣ | Widgets Customizados | 🔄 Em Progresso | Aquila |
| 5️⃣ | Implementação de Telas | 🔄 Em Progresso | Eduardo |
| 6️⃣ | Arquivo Principal e Rotas | ⏳ Planejado | Eduardo |
| 7️⃣ | Responsividade | ⏳ Planejado | Eduardo |
| 8️⃣ | Testes e Build Final | ⏳ Planejado | Ambos |

### Últimos Commits

- ✅ `constants.dart` - Dados mockados com 5 receitas
- ✅ `theme.dart` - ThemeData customizado e cores
- ✅ `recipe_model.dart` - Modelo Recipe completo
- ✅ `ingredient_model.dart` - Modelo Ingredient

---

## 📁 Estrutura do Projeto

```
recipe-app/
├── lib/
│   ├── main.dart                    ⏳ Pendente
│   │
│   ├── screens/                     🔄 Em Progresso
│   │   ├── splash_screen.dart       ⏳ Tela 1
│   │   ├── recipes_list_screen.dart ⏳ Tela 2
│   │   ├── recipe_form_screen.dart  ⏳ Tela 3
│   │   └── recipe_detail_screen.dart⏳ Tela 4
│   │
│   ├── models/                      ✅ Concluído
│   │   ├── recipe_model.dart        ✅ Pronto
│   │   └── ingredient_model.dart    ✅ Pronto
│   │
│   ├── widgets/                     🔄 Em Progresso
│   │   ├── recipe_card.dart         ⏳ Em desenvolvimento
│   │   ├── recipe_form_widget.dart  ⏳ Em desenvolvimento
│   │   └── custom_app_bar.dart      ⏳ Em desenvolvimento
│   │
│   └── utils/                       ✅ Concluído
│       ├── theme.dart               ✅ Pronto
│       └── constants.dart           ✅ Pronto
│
├── assets/
│   └── images/                      📝 A adicionar
│
└── pubspec.yaml
```

---

## 🛠️ Tecnologias

- **Framework:** Flutter 3.x
- **Linguagem:** Dart  
- **Design System:** Material Design 3
- **Navegação:** Navigator (nativo do Flutter)

---

## 📋 Implementação Detalhada

### ✅ Concluído

#### Modelos de Dados (Aquila)

Recipe Model com atributos completos:

```dart
class Recipe {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final String prepTime;
  final String difficulty;
}
```

Ingredient Model para ingredientes:

```dart
class Ingredient {
  final String name;
  final String quantity;
  final String unit;
}
```

#### Tema Customizado (Aquila)

- 🎯 **Cor Primária:** #6D28D9 (roxo vibrante)
- ⚪ **Background:** #FAFAFA (branco puro)
- 📝 **Tipografia:** Escalas de tamanho definidas
- 🔘 **Componentes:** AppBar, Buttons, FAB customizados

#### Dados Mockados (Aquila)

- ✅ 5 receitas completas em `constants.dart`
- ✅ Cada receita com ingredientes e modo de preparo
- ✅ Pronta para uso nas telas

---

### 🔄 Em Desenvolvimento

#### Widgets Customizados (Aquila)

- [ ] CustomAppBar - AppBar reutilizável
- [ ] RecipeCard - Card para listas
- [ ] RecipeFormWidget - Widget de formulário

#### Telas (Eduardo)

- [ ] SplashScreen - Tela inicial com animação
- [ ] RecipesListScreen - Lista com navegação
- [ ] RecipeFormScreen - Formulário com validação  
- [ ] RecipeDetailScreen - Detalhes completos

#### Configuração (Eduardo)

- [ ] main.dart - MaterialApp e rotas
- [ ] Rotas nomeadas - Navegação centralizada
- [ ] Tema global - ThemeData aplicado

---

## 🤝 Fluxo de Colaboração

### Estrutura de Repositórios

**Eduardo - Repositório Principal**

- Gerencia repositório oficial
- Branch: `feature/telas`
- Implementa telas da aplicação
- Realiza code review e merges
- Link: https://github.com/eduardo/recipe-app

**Aquila - Fork Pessoal**

- Fork para portfolio próprio
- Branch: `feature/widgets`
- Implementa componentes reutilizáveis
- Submete Pull Requests
- Link: https://github.com/aquila/recipe-app

### Padrão de Commits

Cada desenvolvedor assina seus commits:

```bash
git commit -m "feat: implementar novo widget

Dev: Eduardo"
```

---

## 🎨 Design Reference

Projeto segue o design profissional do Figma:

**[Recipe App UI Kit - Food Mobile Cooking App](https://www.figma.com/community/file/1370589699536863229/recipe-app-ui-kit-food-mobile-recipe-cooking-app)**

- Paleta: Roxo vibrante com tons neutros
- Componentes: Cards, Formulários, AppBar, FAB
- Responsivo: Adaptado para múltiplas resoluções

---

## 👥 Desenvolvedores

### Eduardo

- **GitHub:** https://github.com/DevSchoof
- **Repositório:** https://github.com/DevSchoof/recipe-app
- **Responsável por:** Telas, Navegação, Main
- **Especialidade:** Implementação e Code Review

### Aquila

- **GitHub:** https://github.com/AquilaOliveira
- **Fork:** https://github.com/AquilaOliveira/recipe-app
- **Responsável por:** Widgets, Tema, Modelos
- **Especialidade:** Componentes Reutilizáveis

---

## 📚 Documentação

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Guide](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)

---

## 🎓 Informações Acadêmicas

- **Instituição:** IFSP - Instituto Federal de São Paulo
- **Campus:** Bragança Paulista
- **Curso:** Análise e Desenvolvimento de Sistemas
- **Disciplina:** BRADEMO - Desenvolvimento para Dispositivos Móveis
- **Professor:** Luiz Gustavo Diniz de Oliveira Veras
- **Período:** 2026/1
- **Apresentação:** 28 de setembro de 2026

---

## 📄 Licença

Este projeto é desenvolvido para fins educacionais como requisito acadêmico da disciplina BRADEMO do IFSP.

---

**Desenvolvido com ❤️ por Eduardo e Aquila**

*Última atualização: Setembro de 2026*