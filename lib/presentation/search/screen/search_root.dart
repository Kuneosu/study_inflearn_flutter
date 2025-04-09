import 'package:flutter/material.dart';
import 'package:inf_fl/core/di/di_setup.dart';
import 'package:inf_fl/core/presentation/components/search_filter_sheet.dart';
import 'package:inf_fl/domain/filter/filter_state.dart';
import 'package:inf_fl/presentation/search/screen/search_screen.dart';
import 'package:inf_fl/presentation/search/search_view_model.dart';

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SearchViewModel>();
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: viewModel.searchRecipes,
          onTapFilter: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SearchFilterSheet(
                  state: viewModel.state.filterState,
                  onChangeFilter: (FilterState state) {
                    viewModel.onChangeFilter(state);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
