import 'package:inf_fl/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<String>> execute() async {
    final recipes = await _recipeRepository.getRecipes();
    return ['All', ...recipes.map((e) => e.category).toSet()];
  }
}
