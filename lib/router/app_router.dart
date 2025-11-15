import 'package:go_router/go_router.dart';
import 'package:world_kitchen/presentation/screens/countries_screen.dart';
import 'package:world_kitchen/presentation/screens/favorites_screen.dart';
import 'package:world_kitchen/presentation/screens/meal_detail_screen.dart';
import 'package:world_kitchen/presentation/screens/recipes_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/countries',
  routes: [
    GoRoute(
      path: '/countries',
      builder: (context, state) => const CountriesScreen(),
    ),
    GoRoute(
      path: '/recipes/:area',
      builder: (context, state) {
        final area = state.pathParameters['area']!;
        return RecipesScreen(area: area);
      },
    ),
    GoRoute(
      path: '/recipe/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return MealDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
  ],
);

