import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/models/ingredient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_recipe_app/widgets/ingredient_list_item.dart';
import 'package:flutter_recipe_app/state/recipe_notifier.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredients = ref.watch(recipeNotifierProvider).ingredients;
    final checkedCount = ingredients.where((i) => i.isChecked).length;
    final totalCollected = ingredients.isNotEmpty ? checkedCount / ingredients.length : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Ingredients'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                ref.read(recipeNotifierProvider.notifier).addIngredient(
                      Ingredient(
                          id: DateTime.now().toString(),
                          name: 'New Ingredient'),
                    );
              }),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: totalCollected,
            minHeight: 10,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              totalCollected == 1.0 ? Colors.green : Colors.blue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = ingredients[index];
                return IngredientListItem(
                  key: ValueKey(ingredient.id),
                  ingredient: ingredient,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
