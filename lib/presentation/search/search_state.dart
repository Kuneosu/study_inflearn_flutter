// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inf_fl/domain/model/recipe.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  final List<Recipe> recipes;
  final bool isLoading;

  SearchState({this.recipes = const [], this.isLoading = false});
}