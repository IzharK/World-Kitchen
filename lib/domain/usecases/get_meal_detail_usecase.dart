import 'package:world_kitchen/core/usecase/usecase.dart';
import 'package:world_kitchen/domain/entities/meal_detail.dart';
import 'package:world_kitchen/domain/repositories/meal_repository.dart';

class GetMealDetailUseCase extends UseCase<MealDetail, String> {
  final MealRepository repository;

  GetMealDetailUseCase(this.repository);

  @override
  Future<MealDetail> call(String id) => repository.getMealDetail(id);
}

