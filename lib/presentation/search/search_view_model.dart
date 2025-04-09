import 'package:flutter/widgets.dart';
import 'package:inf_fl/data/use_case/search_recipes_use_case.dart';
import 'package:inf_fl/domain/filter/filter_state.dart';
import 'package:inf_fl/domain/repository/recent_search_recipe_repository.dart';
import 'package:inf_fl/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchState _state = SearchState(
    filterState: FilterState(time: 'All', rate: 1, category: 'All'),
  );

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

  Future<void> searchRecipes(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final results = await _searchRecipesUseCase.execute(
      query,
      state.filterState,
    );

    _state = _state.copyWith(
      recipes: results,
      isLoading: false,
      searchTitle: 'Search Result',
      resultsCount: '${results.length} results',
      query: query,
    );
    notifyListeners();
  }

  void onChangeFilter(FilterState filterState) async {
    _state = state.copyWith(filterState: filterState);
    await (searchRecipes(state.query));

    notifyListeners();
  }
}
