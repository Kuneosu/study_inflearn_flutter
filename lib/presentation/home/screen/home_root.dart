import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inf_fl/core/routing/route_paths.dart';
import 'package:inf_fl/presentation/home/screen/home_screen.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      name: 'Jega',
      onTapSearchField: () => context.push(RoutePaths.search),
    );
  }
}
