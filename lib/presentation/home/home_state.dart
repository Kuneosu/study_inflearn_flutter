// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final String selectedCategory;
  final List<String> categories;

  HomeState({this.selectedCategory = 'All', this.categories = const []});
}
