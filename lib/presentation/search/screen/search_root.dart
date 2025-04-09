import 'package:flutter/material.dart';
import 'package:inf_fl/data/data_source/local/default_local_storage.dart';
import 'package:inf_fl/data/data_source/local_storage.dart';
import 'package:inf_fl/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:inf_fl/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:inf_fl/data/repository/mock_recipe_repository_impl.dart';
import 'package:inf_fl/data/use_case/search_recipes_use_case.dart';
import 'package:inf_fl/presentation/search/screen/search_screen.dart';
import 'package:inf_fl/presentation/search/search_view_model.dart';

final LocalStorage _localStorage = DefaultLocalStorage();

final _recentSearchRecipeRepository = MockRecentSearchRecipeRepositoryImpl(
  localStorage: _localStorage,
);
final _searchRecipesUseCase = SearchRecipesUseCase(
  recipeRepository: MockRecipeRepositoryImpl(
    recipeDataSource: RemoteRecipeDataSourceImpl(),
  ),
  localStorage: _localStorage,
);

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRecipeRepository: _recentSearchRecipeRepository,
      searchRecipesUseCase: _searchRecipesUseCase,
    );
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: viewModel.searchRecipes,
        );
      },
    );
  }
}
