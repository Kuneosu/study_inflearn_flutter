import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inf_fl/core/di/di_setup.dart';
import 'package:inf_fl/core/routing/route_paths.dart';
import 'package:inf_fl/presentation/home/home_view_model.dart';
import 'package:inf_fl/presentation/home/screen/home_screen.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return HomeScreen(
          state: viewModel.state,
          name: 'Jega',
          onTapSearchField: () => context.push(RoutePaths.search),
          onSelectCategory: viewModel.onSelectCategory,
        );
      },
    );
  }
}
