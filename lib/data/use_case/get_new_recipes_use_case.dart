// import 'package:inf_fl/core/domain/error/error.dart';
import 'package:inf_fl/core/domain/error/result.dart';
import 'package:inf_fl/domain/error/new_recipe_error.dart';
import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/domain/repository/recipe_repository.dart';

class GetNewRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetNewRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NewRecipeError>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();

      if (recipes.isEmpty) {
        return const Result.error(NewRecipeError.noRecipe);
      }

      if (recipes.any((element) => element.category.isEmpty)) {
        return const Result.error(NewRecipeError.invalidCategory);
      }

      return Result.success(recipes.take(5).toList());
    } catch (e) {
      return const Result.error(NewRecipeError.unknown);
    }
  }
}
