import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_detail.freezed.dart';

/// Detailed meal information
@freezed
class MealDetail with _$MealDetail {
  const factory MealDetail({
    required String id,
    required String name,
    required String image,
    required String area,
    required String category,
    required String instructions,
    required List<String> ingredients,
    required List<String> measures,
    String? youtubeUrl,
    String? sourceUrl,
  }) = _MealDetail;
}

