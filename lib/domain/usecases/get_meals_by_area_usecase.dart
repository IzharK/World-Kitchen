import 'package:world_kitchen/core/usecase/usecase.dart';
import 'package:world_kitchen/domain/entities/meal_summary.dart';
import 'package:world_kitchen/domain/repositories/meal_repository.dart';

class GetMealsByAreaUseCase extends UseCase<List<MealSummary>, String> {
  final MealRepository repository;

  GetMealsByAreaUseCase(this.repository);

  @override
  Future<List<MealSummary>> call(String area) =>
      repository.getMealsByArea(area);
}

