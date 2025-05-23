import 'package:inf_fl/data/data_source/local_storage.dart';
import 'package:inf_fl/domain/filter/filter_state.dart';
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

  Future<List<Recipe>> execute(String query, FilterState filterState) async {
    final results = (await _recipeRepository.getRecipes())
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .where((e) {
          if (filterState.time == 'All') {
            return true;
          } else {
            return filterState.time == e.time;
          }
        })
        .where((e) => e.rating >= filterState.rate)
        .where((e) {
          if (filterState.category == 'All') {
            return true;
          } else {
            return filterState.category == e.category;
          }
        });
    _localStorage.save({'recipes': results.map((e) => e.toJson())});
    return results.toList();
  }
}
