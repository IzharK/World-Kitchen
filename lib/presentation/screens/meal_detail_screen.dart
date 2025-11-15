import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_kitchen/domain/entities/favorite.dart';
import 'package:world_kitchen/presentation/providers/favorites_provider.dart';
import 'package:world_kitchen/presentation/providers/meal_detail_provider.dart';
import 'package:world_kitchen/presentation/widgets/grocery_navigator.dart';

class MealDetailScreen extends StatefulWidget {
  final String id;

  const MealDetailScreen({super.key, required this.id});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealDetailProvider>().loadMealDetail(widget.id);
      _checkIfFavorite();
    });
  }

  Future<void> _checkIfFavorite() async {
    final isFav = await context.read<FavoritesProvider>().isFavorite(widget.id);
    setState(() => _isFavorite = isFav);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Details'), centerTitle: true),
      body: Consumer<MealDetailProvider>(
        builder: (context, provider, _) {
          return provider.state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (meal) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    meal.image,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    meal.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                  Text('${meal.area} • ${meal.category}'),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                if (_isFavorite) {
                                  await context
                                      .read<FavoritesProvider>()
                                      .removeFavorite(meal.id);
                                } else {
                                  await context
                                      .read<FavoritesProvider>()
                                      .addFavorite(
                                        Favorite(
                                          id: meal.id,
                                          name: meal.name,
                                          image: meal.image,
                                          area: meal.area,
                                        ),
                                      );
                                }
                                await _checkIfFavorite();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Ingredients',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        ...List.generate(
                          meal.ingredients.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Expanded(child: Text(meal.ingredients[index])),
                                Text(
                                  meal.measures[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () =>
                                      GroceryNavigator.searchIngredient(
                                        meal.ingredients[index],
                                      ),
                                  child: const Text('Buy'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Instructions',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(meal.instructions),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }
}
