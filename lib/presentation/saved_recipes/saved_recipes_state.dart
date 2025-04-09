// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inf_fl/domain/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

// @freezed
// class SavedRecipesState with _$SavedRecipesState {
//   const factory SavedRecipesState({
//     @Default([]) List<Recipe> recipes,
//     @Default(false) bool isLoading,
//   }) = _SavedRecipesState;

//   @override
//   bool get isLoading => throw UnimplementedError();

//   @override
//   List<Recipe> get recipes => throw UnimplementedError();
// }

@freezed
class SavedRecipesState with _$SavedRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;

  SavedRecipesState({this.recipes = const [], this.isLoading = false});
}
