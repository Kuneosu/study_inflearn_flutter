import 'dart:io';

import 'package:inf_fl/core/domain/error/network_error.dart';
import 'package:inf_fl/core/domain/error/result.dart';
import 'package:inf_fl/domain/repository/recipe_repository.dart';
import 'package:inf_fl/core/domain/error/error.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<String>, NetworkError>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();
      return Result.success(['All', ...recipes.map((e) => e.category).toSet()]);
    } on SocketException {
      return Result.error(NetworkError.noInternet);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}

enum RecipeError implements Error { noRecipe }
