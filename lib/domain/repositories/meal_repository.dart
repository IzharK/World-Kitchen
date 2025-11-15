import 'package:world_kitchen/domain/entities/area.dart';
import 'package:world_kitchen/domain/entities/favorite.dart';
import 'package:world_kitchen/domain/entities/meal_detail.dart';
import 'package:world_kitchen/domain/entities/meal_summary.dart';

/// Repository interface for meal operations
abstract class MealRepository {
  /// Get list of all areas/countries
  Future<List<Area>> getAreas();

  /// Get meals for a specific area
  Future<List<MealSummary>> getMealsByArea(String area);

  /// Get detailed information about a meal
  Future<MealDetail> getMealDetail(String id);

  /// Add a meal to favorites
  Future<void> addFavorite(Favorite favorite);

  /// Remove a meal from favorites
  Future<void> removeFavorite(String id);

  /// Get all favorite meals
  Future<List<Favorite>> getFavorites();

  /// Check if a meal is favorited
  Future<bool> isFavorite(String id);
}

