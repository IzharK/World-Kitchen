import 'package:world_kitchen/core/usecase/usecase.dart';
import 'package:world_kitchen/domain/entities/area.dart';
import 'package:world_kitchen/domain/repositories/meal_repository.dart';

class GetAreasUseCase extends UseCaseNoParams<List<Area>> {
  final MealRepository repository;

  GetAreasUseCase(this.repository);

  @override
  Future<List<Area>> call() => repository.getAreas();
}

