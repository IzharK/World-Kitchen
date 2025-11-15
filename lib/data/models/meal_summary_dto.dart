import 'package:json_annotation/json_annotation.dart';
import 'package:world_kitchen/domain/entities/meal_summary.dart';

part 'meal_summary_dto.g.dart';

@JsonSerializable()
class MealSummaryDto {
  @JsonKey(name: 'idMeal')
  final String idMeal;

  @JsonKey(name: 'strMeal')
  final String strMeal;

  @JsonKey(name: 'strMealThumb')
  final String strMealThumb;

  MealSummaryDto({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  factory MealSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$MealSummaryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealSummaryDtoToJson(this);

  MealSummary toEntity() => MealSummary(
        id: idMeal,
        name: strMeal,
        image: strMealThumb,
      );
}

