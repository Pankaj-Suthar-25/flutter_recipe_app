import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_recipe_app/models/ingredient.dart';

class RecipeState extends Equatable {
  final List<Ingredient> ingredients;

  const RecipeState({required this.ingredients});
  RecipeState copyWith({List<Ingredient>? ingredients}) {
    return RecipeState(
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  List<Object?> get props => [ingredients];
}

class RecipeNotifier extends StateNotifier<RecipeState> {
  RecipeNotifier() : super(const RecipeState(ingredients: []));

  void addIngredient(Ingredient ingredient) {
    state = state.copyWith(
      ingredients: [...state.ingredients, ingredient],
    );
  }

  void toggleIngredient(String ingredientId) {
    state = state.copyWith(
      ingredients: [
        for (final ingredient in state.ingredients)
          if (ingredient.id == ingredientId)
            ingredient.copyWith(isChecked: !ingredient.isChecked)
          else
            ingredient,
      ],
    );
  }
}

final recipeNotifierProvider =
    StateNotifierProvider<RecipeNotifier, RecipeState>(
  (ref) => RecipeNotifier(),
);
