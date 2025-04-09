import 'package:go_router/go_router.dart';
import 'package:inf_fl/core/routing/route_paths.dart';
import 'package:inf_fl/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:inf_fl/presentation/sign_in/sign_in_screen.dart';
import 'package:inf_fl/presentation/sign_up/sign_up_screen.dart';
import 'package:inf_fl/presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder:
          (context, state) => SplashScreen(
            onTapStartCooking: () {
              context.go(RoutePaths.signIn);
            },
          ),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder:
          (context, state) => SignInScreen(
            onTapSignIn: () => context.go(RoutePaths.savedRecipes),
            onTapSignUp: () => context.go(RoutePaths.signUp),
          ),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder:
          (context, state) => SignUpScreen(
            onTapSignIn: () {
              context.go(RoutePaths.signIn);
            },
          ),
    ),
    GoRoute(
      path: RoutePaths.savedRecipes,
      builder: (context, state) => const SavedRecipesRoot(),
    ),
  ],
);
