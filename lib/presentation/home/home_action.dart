import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_action.freezed.dart';

@freezed
sealed class HomeAction<T> with _$HomeAction<T> {
  const factory HomeAction.onTapSearchField() = OnTapSearchField;
  const factory HomeAction.onSelectCategory(String category) = OnSelectCategory;
}