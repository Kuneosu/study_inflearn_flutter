import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inf_fl/core/domain/error/network_error.dart';
import 'package:inf_fl/core/domain/error/result.dart';
import 'package:inf_fl/data/use_case/get_categories_use_case.dart';
import 'package:inf_fl/data/use_case/get_dishes_by_category_use_case.dart';
import 'package:inf_fl/presentation/home/home_state.dart';
import 'package:inf_fl/core/domain/error/error.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;

  final _eventController = StreamController<Error>();
  Stream<Error> get eventStream => _eventController.stream;

  HomeState _state = HomeState();

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase,
       _getDishesByCategoryUseCase = getDishesByCategoryUseCase {
    _fetchCategories();
  }

  HomeState get state => _state;

  void _fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<String>, NetworkError>():
        _state = _state.copyWith(
          categories: result.data,
          selectedCategory: 'All',
        );
        notifyListeners();
        await _fetchDishesByCategory('All');

      case ResultError<List<String>, NetworkError>():
        switch (result.error) {
          case NetworkError.requestTimeout:
          case NetworkError.noInternet:
          case NetworkError.serverError:
          case NetworkError.unknown:
        }
        debugPrint(result.error.toString());
        _eventController.add(result.error);
    }
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }

  Future<void> _fetchDishesByCategory(String category) async {
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = _state.copyWith(dishes: dishes);
    notifyListeners();
  }
}
