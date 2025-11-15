import 'package:flutter/material.dart';
import 'package:world_kitchen/core/util/ui_state.dart';
import 'package:world_kitchen/domain/entities/favorite.dart';
import 'package:world_kitchen/domain/usecases/favorite_usecases.dart';

class FavoritesProvider extends ChangeNotifier {
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;

  UiState<List<Favorite>> state = const UiState.loading();

  FavoritesProvider({
    required this.getFavoritesUseCase,
    required this.addFavoriteUseCase,
    required this.removeFavoriteUseCase,
    required this.isFavoriteUseCase,
  }) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = const UiState.loading();
    notifyListeners();

    try {
      final favorites = await getFavoritesUseCase();
      state = UiState.success(favorites);
    } catch (e) {
      state = UiState.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> addFavorite(Favorite favorite) async {
    try {
      await addFavoriteUseCase(favorite);
      await loadFavorites();
    } catch (e) {
      state = UiState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> removeFavorite(String id) async {
    try {
      await removeFavoriteUseCase(id);
      await loadFavorites();
    } catch (e) {
      state = UiState.error(e.toString());
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    try {
      return await isFavoriteUseCase(id);
    } catch (e) {
      return false;
    }
  }
}

