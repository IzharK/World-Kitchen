import 'package:drift/drift.dart';
import 'package:world_kitchen/core/error/exceptions.dart';
import 'package:world_kitchen/data/datasources/local/meal_database.dart';
import 'package:world_kitchen/domain/entities/favorite.dart' as domain;

abstract class MealLocalDatasource {
  Future<void> addFavorite(domain.Favorite favorite);
  Future<void> removeFavorite(String id);
  Future<List<domain.Favorite>> getFavorites();
  Future<bool> isFavorite(String id);
}

class MealLocalDatasourceImpl implements MealLocalDatasource {
  final MealDatabase database;

  MealLocalDatasourceImpl({required this.database});

  @override
  Future<void> addFavorite(domain.Favorite favorite) async {
    try {
      await database.insertFavorite(
        FavoritesCompanion(
          id: Value(favorite.id),
          name: Value(favorite.name),
          image: Value(favorite.image),
          area: Value(favorite.area),
        ),
      );
    } catch (e) {
      throw CacheException(message: 'Failed to add favorite: $e');
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    try {
      await database.deleteFavorite(id);
    } catch (e) {
      throw CacheException(message: 'Failed to remove favorite: $e');
    }
  }

  @override
  Future<List<domain.Favorite>> getFavorites() async {
    try {
      final favorites = await database.getAllFavorites();
      return favorites
          .map(
            (f) => domain.Favorite(
              id: f.id,
              name: f.name,
              image: f.image,
              area: f.area,
            ),
          )
          .toList();
    } catch (e) {
      throw CacheException(message: 'Failed to get favorites: $e');
    }
  }

  @override
  Future<bool> isFavorite(String id) async {
    try {
      final favorite = await database.getFavoriteById(id);
      return favorite != null;
    } catch (e) {
      throw CacheException(message: 'Failed to check favorite: $e');
    }
  }
}
