import 'package:dio/dio.dart';
import 'package:world_kitchen/core/error/exceptions.dart';
import 'package:world_kitchen/data/models/area_dto.dart';
import 'package:world_kitchen/data/models/meal_detail_dto.dart';
import 'package:world_kitchen/data/models/meal_summary_dto.dart';

abstract class MealRemoteDatasource {
  Future<List<AreaDto>> getAreas();
  Future<List<MealSummaryDto>> getMealsByArea(String area);
  Future<MealDetailDto> getMealDetail(String id);
}

class MealRemoteDatasourceImpl implements MealRemoteDatasource {
  final Dio dio;

  MealRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<AreaDto>> getAreas() async {
    try {
      final response = await dio.get('/list.php?a=list');
      final meals = (response.data['meals'] as List)
          .map((m) => AreaDto.fromJson(m as Map<String, dynamic>))
          .toList();
      return meals;
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Failed to fetch areas',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<List<MealSummaryDto>> getMealsByArea(String area) async {
    try {
      final response = await dio.get('/filter.php?a=$area');
      final meals = (response.data['meals'] as List?)
              ?.map((m) => MealSummaryDto.fromJson(m as Map<String, dynamic>))
              .toList() ??
          [];
      return meals;
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Failed to fetch meals',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<MealDetailDto> getMealDetail(String id) async {
    try {
      final response = await dio.get('/lookup.php?i=$id');
      final meal = MealDetailDto.fromJson(
        (response.data['meals'] as List).first as Map<String, dynamic>,
      );
      return meal;
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Failed to fetch meal detail',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }
}

