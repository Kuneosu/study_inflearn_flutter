import 'dart:io';


import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/domain/repository/recipe_repository.dart';

class ErrorMockRecipeRepositoryImpl implements RecipeRepository {
  // final RecipeDataSource _recipeDataSource;

  // ErrorMockRecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
  //   : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipe(int id) async {
    final recipes = await getRecipes();
    return recipes.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    throw SocketException('');
  }
}
