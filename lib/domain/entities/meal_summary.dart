import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_summary.freezed.dart';

/// Meal summary entity with basic information
@freezed
class MealSummary with _$MealSummary {
  const factory MealSummary({
    required String id,
    required String name,
    required String image,
  }) = _MealSummary;
}

