import 'package:world_kitchen/core/usecase/usecase.dart';
import 'package:world_kitchen/domain/entities/favorite.dart';
import 'package:world_kitchen/domain/repositories/meal_repository.dart';

class AddFavoriteUseCase extends UseCase<void, Favorite> {
  final MealRepository repository;

  AddFavoriteUseCase(this.repository);

  @override
  Future<void> call(Favorite favorite) => repository.addFavorite(favorite);
}

class RemoveFavoriteUseCase extends UseCase<void, String> {
  final MealRepository repository;

  RemoveFavoriteUseCase(this.repository);

  @override
  Future<void> call(String id) => repository.removeFavorite(id);
}

class GetFavoritesUseCase extends UseCaseNoParams<List<Favorite>> {
  final MealRepository repository;

  GetFavoritesUseCase(this.repository);

  @override
  Future<List<Favorite>> call() => repository.getFavorites();
}

class IsFavoriteUseCase extends UseCase<bool, String> {
  final MealRepository repository;

  IsFavoriteUseCase(this.repository);

  @override
  Future<bool> call(String id) => repository.isFavorite(id);
}

