import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get_it/get_it.dart';
import 'package:world_kitchen/data/datasources/local/meal_database.dart';
import 'package:world_kitchen/data/datasources/local/meal_local_datasource.dart';
import 'package:world_kitchen/data/datasources/remote/meal_remote_datasource.dart';
import 'package:world_kitchen/data/repositories/meal_repository_impl.dart';
import 'package:world_kitchen/domain/repositories/meal_repository.dart';
import 'package:world_kitchen/domain/usecases/favorite_usecases.dart';
import 'package:world_kitchen/domain/usecases/get_areas_usecase.dart';
import 'package:world_kitchen/domain/usecases/get_meal_detail_usecase.dart';
import 'package:world_kitchen/domain/usecases/get_meals_by_area_usecase.dart';
import 'package:world_kitchen/presentation/providers/countries_provider.dart';
import 'package:world_kitchen/presentation/providers/favorites_provider.dart';
import 'package:world_kitchen/presentation/providers/meal_detail_provider.dart';
import 'package:world_kitchen/presentation/providers/recipes_provider.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Dio
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.themealdb.com/api/json/v1/1',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  dio.interceptors.add(LoggingInterceptor());
  getIt.registerSingleton<Dio>(dio);

  // Database
  final database = MealDatabase();
  getIt.registerSingleton<MealDatabase>(database);

  // Datasources
  getIt.registerSingleton<MealRemoteDatasource>(
    MealRemoteDatasourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerSingleton<MealLocalDatasource>(
    MealLocalDatasourceImpl(database: getIt<MealDatabase>()),
  );

  // Repository
  getIt.registerSingleton<MealRepository>(
    MealRepositoryImpl(
      remoteDatasource: getIt<MealRemoteDatasource>(),
      localDatasource: getIt<MealLocalDatasource>(),
    ),
  );

  // Use Cases
  getIt.registerSingleton<GetAreasUseCase>(
    GetAreasUseCase(getIt<MealRepository>()),
  );
  getIt.registerSingleton<GetMealsByAreaUseCase>(
    GetMealsByAreaUseCase(getIt<MealRepository>()),
  );
  getIt.registerSingleton<GetMealDetailUseCase>(
    GetMealDetailUseCase(getIt<MealRepository>()),
  );
  getIt.registerSingleton<AddFavoriteUseCase>(
    AddFavoriteUseCase(getIt<MealRepository>()),
  );
  getIt.registerSingleton<RemoveFavoriteUseCase>(
    RemoveFavoriteUseCase(getIt<MealRepository>()),
  );
  getIt.registerSingleton<GetFavoritesUseCase>(
    GetFavoritesUseCase(getIt<MealRepository>()),
  );
  getIt.registerSingleton<IsFavoriteUseCase>(
    IsFavoriteUseCase(getIt<MealRepository>()),
  );

  // Providers
  getIt.registerSingleton<CountriesProvider>(
    CountriesProvider(getAreasUseCase: getIt<GetAreasUseCase>()),
  );
  getIt.registerSingleton<RecipesProvider>(
    RecipesProvider(getMealsByAreaUseCase: getIt<GetMealsByAreaUseCase>()),
  );
  getIt.registerSingleton<MealDetailProvider>(
    MealDetailProvider(getMealDetailUseCase: getIt<GetMealDetailUseCase>()),
  );
  getIt.registerSingleton<FavoritesProvider>(
    FavoritesProvider(
      getFavoritesUseCase: getIt<GetFavoritesUseCase>(),
      addFavoriteUseCase: getIt<AddFavoriteUseCase>(),
      removeFavoriteUseCase: getIt<RemoveFavoriteUseCase>(),
      isFavoriteUseCase: getIt<IsFavoriteUseCase>(),
    ),
  );
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
    }
    return super.onError(err, handler);
  }
}
