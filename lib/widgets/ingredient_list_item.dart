import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_recipe_app/models/ingredient.dart';
import 'package:flutter_recipe_app/state/recipe_notifier.dart';

class IngredientListItem extends ConsumerWidget {
  final Ingredient ingredient;

  const IngredientListItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        ingredient.name,
        style: TextStyle(
          color: ingredient.isChecked ? Colors.grey : Colors.black,
          decoration: ingredient.isChecked
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: ingredient.isChecked,
        onChanged: (value) {
          ref
              .read(recipeNotifierProvider.notifier)
              .toggleIngredient(ingredient.id);
        },
      ),
    );
  }
}
