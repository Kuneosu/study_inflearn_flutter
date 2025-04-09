import 'package:flutter/material.dart';
import 'package:inf_fl/data/use_case/get_categories_use_case.dart';
import 'package:inf_fl/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  HomeState _state = HomeState();

  HomeViewModel({required GetCategoriesUseCase getCategoriesUseCase})
    : _getCategoriesUseCase = getCategoriesUseCase {
    _fetchCategories();
  }
  HomeState get state => _state;

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();
  }

  void _fetchCategories() async {
    _state = _state.copyWith(
      categories: await _getCategoriesUseCase.execute(),
      selectedCategory: 'All',
    );
    notifyListeners();
  }
}
