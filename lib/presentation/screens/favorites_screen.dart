import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:world_kitchen/presentation/providers/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, _) {
          return provider.state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (favorites) {
              if (favorites.isEmpty) {
                return const Center(child: Text('No favorites yet'));
              }
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final favorite = favorites[index];
                  return ListTile(
                    leading: Image.network(
                      favorite.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(favorite.name),
                    subtitle: Text(favorite.area),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => context
                          .read<FavoritesProvider>()
                          .removeFavorite(favorite.id),
                    ),
                    onTap: () => context.push('/recipe/${favorite.id}'),
                  );
                },
              );
            },
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<FavoritesProvider>().loadFavorites(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
