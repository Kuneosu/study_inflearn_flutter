import 'package:get_it/get_it.dart';
import 'package:inf_fl/data/data_source/local/default_local_storage.dart';
import 'package:inf_fl/data/data_source/local_storage.dart';
import 'package:inf_fl/data/data_source/recipe_data_source.dart';
import 'package:inf_fl/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:inf_fl/data/repository/mock_bookmark_repository_impl.dart';
import 'package:inf_fl/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:inf_fl/data/repository/mock_recipe_repository_impl.dart';
import 'package:inf_fl/data/use_case/get_saved_recipes_use_case.dart';
import 'package:inf_fl/data/use_case/search_recipes_use_case.dart';
import 'package:inf_fl/domain/repository/bookmark_repository.dart';
import 'package:inf_fl/domain/repository/recent_search_recipe_repository.dart';
import 'package:inf_fl/domain/repository/recipe_repository.dart';
import 'package:inf_fl/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:inf_fl/presentation/search/search_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Data Source
  getIt.registerSingleton<RecipeDataSource>(RemoteRecipeDataSourceImpl());
  getIt.registerSingleton<LocalStorage>(DefaultLocalStorage());

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    MockRecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<BookmarkRepository>(MockBookmarkRepositoryImpl());
  getIt.registerSingleton<RecentSearchRecipeRepository>(
    MockRecentSearchRecipeRepositoryImpl(localStorage: getIt()),
  );

  // Use Case
  getIt.registerSingleton(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );
  getIt.registerSingleton(
    SearchRecipesUseCase(recipeRepository: getIt(), localStorage: getIt()),
  );

  // View Model
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(getSavedRecipesUseCase: getIt()),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(
      recentSearchRecipeRepository: getIt(),
      searchRecipesUseCase: getIt(),
    ),
  );
}
