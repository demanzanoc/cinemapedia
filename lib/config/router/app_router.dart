import 'package:cinemapedia/config/router/routes.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: defaultHomeRoute,
  routes: [
    GoRoute(
      path: homeRoute,
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
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
        path: initialRoute,
        redirect: (_, __) => defaultHomeRoute
    ),
  ],
);
