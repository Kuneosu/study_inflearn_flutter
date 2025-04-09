import 'package:flutter/material.dart';
import 'package:inf_fl/core/di/di_setup.dart';
import 'package:inf_fl/core/routing/router.dart';
import 'package:inf_fl/ui/color_st.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        scaffoldBackgroundColor: CST.white,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
