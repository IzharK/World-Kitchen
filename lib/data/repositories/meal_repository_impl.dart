import 'package:world_kitchen/core/error/exceptions.dart';
import 'package:world_kitchen/data/datasources/local/meal_local_datasource.dart';
import 'package:world_kitchen/data/datasources/remote/meal_remote_datasource.dart';
import 'package:world_kitchen/domain/entities/area.dart';
import 'package:world_kitchen/domain/entities/favorite.dart';
import 'package:world_kitchen/domain/entities/meal_detail.dart';
import 'package:world_kitchen/domain/entities/meal_summary.dart';
import 'package:world_kitchen/domain/repositories/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDatasource remoteDatasource;
  final MealLocalDatasource localDatasource;

  MealRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<List<Area>> getAreas() async {
    try {
      final dtos = await remoteDatasource.getAreas();
      return dtos.map((dto) => dto.toEntity()).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<List<MealSummary>> getMealsByArea(String area) async {
    try {
      final dtos = await remoteDatasource.getMealsByArea(area);
      return dtos.map((dto) => dto.toEntity()).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<MealDetail> getMealDetail(String id) async {
    try {
      final dto = await remoteDatasource.getMealDetail(id);
      return dto.toEntity();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<void> addFavorite(Favorite favorite) async {
    try {
      await localDatasource.addFavorite(favorite);
    } on CacheException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    try {
      await localDatasource.removeFavorite(id);
    } on CacheException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<List<Favorite>> getFavorites() async {
    try {
      return await localDatasource.getFavorites();
    } on CacheException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<bool> isFavorite(String id) async {
    try {
      return await localDatasource.isFavorite(id);
    } on CacheException {
      rethrow;
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }
}

