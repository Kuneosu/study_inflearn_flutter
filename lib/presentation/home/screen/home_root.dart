import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inf_fl/core/di/di_setup.dart';
import 'package:inf_fl/core/routing/route_paths.dart';
import 'package:inf_fl/presentation/home/home_view_model.dart';
import 'package:inf_fl/presentation/home/screen/home_screen.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  late HomeViewModel viewModel;
  StreamSubscription? eventSubscription;

  @override
  void initState() {
    viewModel = getIt<HomeViewModel>();
    eventSubscription = viewModel.eventStream.listen((event) {
      debugPrint(event.toString());
      if (!mounted) return;
      final snackBar = SnackBar(content: Text(event.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    super.initState();
  }

  @override
  void dispose() {
    eventSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
