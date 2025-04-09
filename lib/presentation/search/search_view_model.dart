import 'package:flutter/widgets.dart';
import 'package:inf_fl/data/use_case/search_recipes_use_case.dart';
import 'package:inf_fl/domain/repository/recent_search_recipe_repository.dart';
import 'package:inf_fl/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchState _state = SearchState();

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
    required SearchRecipesUseCase searchRecipesUseCase,
  }) : _recentSearchRecipeRepository = recentSearchRecipeRepository,
       _searchRecipesUseCase = searchRecipesUseCase {
    _loadRecentSearchRecipes();
  }

  SearchState get state => _state;
  void _loadRecentSearchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _recentSearchRecipeRepository.getRecentSearchRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _searchRecipesUseCase.execute(query),
      isLoading: false,
    );
    notifyListeners();
  }
}
