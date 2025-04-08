import 'package:flutter/material.dart';
import 'package:inf_fl/core/presentation/components/recipe_card.dart';
import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/ui/text_st.dart';

class SavedRecipesScreen extends StatelessWidget {
  final List<Recipe> recipes;
  const SavedRecipesScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved recipes', style: TST.mediumTextBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(recipe: recipes[index]);
          },
        ),
      ),
    );
  }
}
