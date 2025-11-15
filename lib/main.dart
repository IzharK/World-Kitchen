import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:world_kitchen/di/injector.dart';
import 'package:world_kitchen/presentation/providers/countries_provider.dart';
import 'package:world_kitchen/presentation/providers/favorites_provider.dart';
import 'package:world_kitchen/presentation/providers/meal_detail_provider.dart';
import 'package:world_kitchen/presentation/providers/recipes_provider.dart';
import 'package:world_kitchen/router/app_router.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<CountriesProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<RecipesProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<MealDetailProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<FavoritesProvider>()),
      ],
      child: MaterialApp.router(
        title: 'World Kitchen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme().copyWith(
            displayLarge: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().displayLarge,
            ),
            displayMedium: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().displayMedium,
            ),
            displaySmall: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().displaySmall,
            ),
            headlineLarge: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().headlineLarge,
            ),
            headlineMedium: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().headlineMedium,
            ),
            headlineSmall: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().headlineSmall,
            ),
            titleLarge: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().titleLarge,
            ),
            titleMedium: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().titleMedium,
            ),
            titleSmall: GoogleFonts.playfairDisplay(
              textStyle: GoogleFonts.robotoTextTheme().titleSmall,
            ),
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
