import 'package:cinemapedia/config/router/routes.dart';
import 'package:cinemapedia/presentation/views/home_views/favorites_view.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: homeRoute,
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(childView: child),
      routes: [
        GoRoute(
          path: homeRoute,
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
              path: movieDetailRoute,
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id';
                return MovieScreen(movieId: movieId);
              },
            ),
          ],
        ),
        GoRoute(
          path: favoritesRoute,
          builder: (context, state) => const FavoritesView(),
        )
      ],
    ),
  ],
);
