// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';

@freezed
class FilterState with _$FilterState {
  final String time;
  final int rate;
  final String category;

  FilterState({required this.time, required this.rate, required this.category});
}
