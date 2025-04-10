// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inf_fl/domain/model/recipe.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final String selectedCategory;
  final List<String> categories;
  final List<Recipe> dishes;
  final List<Recipe> newRecipes;
  final String name;

  HomeState({
    this.selectedCategory = 'All',
    this.categories = const [],
    this.dishes = const [],
    this.newRecipes = const [],
    this.name = '',
  });
}
