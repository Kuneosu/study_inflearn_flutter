import 'package:inf_fl/data/data_source/local_storage.dart';
import 'package:inf_fl/domain/model/recipe.dart';
import 'package:inf_fl/domain/repository/recent_search_recipe_repository.dart';

class MockRecentSearchRecipeRepositoryImpl
    implements RecentSearchRecipeRepository {
  final LocalStorage _localStorage;

  MockRecentSearchRecipeRepositoryImpl({required LocalStorage localStorage})
    : _localStorage = localStorage;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    try {
      final json = await _localStorage.load();
      return (json['recipes'] as Iterable)
          .map((e) => Recipe.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) async {
    _localStorage.save({'recipes': recipes.map((e) => e.toJson())});
  }
}
