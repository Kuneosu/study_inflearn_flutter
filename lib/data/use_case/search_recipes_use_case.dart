import 'package:inf_fl/data/data_source/local_storage.dart';
import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final LocalStorage _localStorage;

  SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
    required LocalStorage localStorage,
  }) : _recipeRepository = recipeRepository,
       _localStorage = localStorage;

  Future<List<Recipe>> execute(String query) async {
    final results = (await _recipeRepository.getRecipes()).where(
      (e) => e.name.toLowerCase().contains(query.toLowerCase()),
    );
    _localStorage.save({'recipes': results.map((e) => e.toJson())});
    return results.toList();
  }
}
