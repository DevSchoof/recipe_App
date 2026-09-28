# 🍳 DishDash — Recipe App

Aplicativo mobile para descobrir, listar e cadastrar receitas, desenvolvido em Flutter como Projeto Bimestral 1 da disciplina BRADEMO (Desenvolvimento para Dispositivos Móveis) do IFSP.

- **👥 Desenvolvedores:** Áquila e Eduardo
- **📅 Apresentação:** 28 de setembro de 2026
- **🏫 Campus:** IFSP Bragança Paulista
- **🎨 Leiaute de referência:** [Recipe App UI Kit — Food Mobile Cooking App](https://www.figma.com/pt-br/comunidade/file/1370589699536863229/recipe-app-ui-kit-food-mobile-recipe-cooking-app) (Figma)

---

## ✨ Funcionalidades

- **🎨 Tela de Splash** — apresentação animada do app, com navegação automática para a Home.
- **📋 Lista de Receitas** — busca por nome, filtro por categoria, alternância entre lista e grade, favoritos.
- **➕ Nova Receita** — formulário com validação de campos e feedback visual de sucesso.
- **🔍 Detalhes da Receita** — ingredientes, modo de preparo, tempo e dificuldade.

## 🎨 Design

- Paleta principal: rosa/coral (`#FF5B7F`) sobre fundo neutro (`#FAFAFA`), fiel ao kit do Figma.
- Componentes reutilizáveis (`RecipeCard`, `CustomAppBar`, `RecipeImage`) mantendo consistência visual entre telas.
- Layout responsivo via `MediaQuery`, adaptando lista/grade conforme a largura da tela.

---

### 🔧 Arquitetura Sólida

- ✅ Estrutura em camadas (models, screens, widgets, utils)
- ✅ Navegação inteligente com Navigator
- ✅ Passagem de dados entre componentes  
- ✅ Tema centralizado e reutilizável

---

## ✅ Requisitos do Projeto Bimestral 1 (BRADEMO)

O projeto não possui persistência de dados nem gerenciamento de estado entre execuções, conforme escopo definido pelo enunciado. Todos os recursos obrigatórios (RC1–RC7) estão implementados:

| Recurso | Descrição | Onde |
|---|---|---|
| RC1 | Estrutura de pastas por camada | `lib/models`, `lib/screens`, `lib/utils`, `lib/widgets` |
| RC2 | Rotas e navegação com `Navigator` | Rotas nomeadas em `main.dart` (`/home`, `/form`, `/detail`) |
| RC3 | Passagem de dados entre telas | `arguments` (lista → detalhe) e retorno via `Navigator.pop` (formulário → lista) |
| RC4 | Formulário com validação | `RecipeFormScreen` (`Form`, `TextFormField`, `DropdownButton`) |
| RC5 | Responsividade com `MediaQuery` | `RecipesListScreen` (alterna lista/grade conforme largura) |
| RC6 | Tema centralizado (`ThemeData`) | `utils/theme.dart` |
| RC7 | Widgets Material (`AppBar`, `FloatingActionButton`) | `CustomAppBar` e FAB em `RecipesListScreen` |

Telas implementadas: Boas-vindas, Lista de itens, Formulário de entrada e Detalhes do item — as quatro exigidas pelo enunciado.

---

## 📁 Estrutura do Projeto

```
recipe_app/
├── lib/
│   ├── main.dart                     # MaterialApp, tema e rotas nomeadas
│   ├── screens/
│   │   ├── splash_screen.dart        # Tela 1 — Boas-vindas
│   │   ├── recipes_list_screen.dart  # Tela 2 — Lista de receitas
│   │   ├── recipe_form_screen.dart   # Tela 3 — Formulário de nova receita
│   │   └── recipe_detail_screen.dart # Tela 4 — Detalhes da receita
│   ├── models/
│   │   ├── recipe_model.dart
│   │   └── ingredient_model.dart
│   ├── widgets/
│   │   ├── recipe_card.dart
│   │   ├── recipe_image.dart
│   │   └── custom_app.dart           # CustomAppBar reutilizável
│   └── utils/
│       ├── theme.dart                # ThemeData do app
│       └── constants.dart            # Dados mockados (sem backend)
├── docs/
│   ├── DishDash — Apresentação do Projeto.pdf
│   ├── DishDash — Apresentação do Projeto.pptx
│   └── *.png                         # Capturas de tela do app em funcionamento
└── pubspec.yaml

```

---

## 🎤 Apresentação

- Os slides da apresentação estão em `docs/`, nos formatos **PDF** e **PPTX**.
- A pasta também reúne capturas de tela reais do app em execução (splash, lista, formulário e detalhes da receita), usadas como evidência da fidelidade ao leiaute do Figma.


---

## 🚀 Como executar

### Pré-requisitos

```
✓ Flutter 3.x ou superior
✓ Dart SDK
✓ Android SDK (para emulador) ou navegador (para build Web)
✓ Git
```

### Instalação Rápida

```bash
git clone https://github.com/DevSchoof/recipe_App.git
cd recipe_App
flutter pub get
flutter run
```

---

## 🛠️ Tecnologias

- **Framework:** Flutter
- **Linguagem:** Dart
- **Design System:** Material Design
- **Navegação:** `Navigator` nativo do Flutter, com rotas nomeadas

---

## 🎓 Informações Acadêmicas

- **Instituição:** IFSP — Instituto Federal de São Paulo
- **Campus:** Bragança Paulista
- **Curso:** Tecnologia em Análise e Desenvolvimento de Sistemas
- **Disciplina:** BRADEMO — Desenvolvimento para Dispositivos Móveis
- **Professor:** Luiz Gustavo Diniz de Oliveira Véras
- **Apresentação:** 28 de setembro de 2026

Projeto desenvolvido para fins educacionais como requisito da disciplina BRADEMO.