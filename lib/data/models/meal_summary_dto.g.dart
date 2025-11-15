// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealSummaryDto _$MealSummaryDtoFromJson(Map<String, dynamic> json) =>
    MealSummaryDto(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
    );

Map<String, dynamic> _$MealSummaryDtoToJson(MealSummaryDto instance) =>
    <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
    };
