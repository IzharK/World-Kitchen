import 'package:flutter/material.dart';
import 'package:world_kitchen/core/util/ui_state.dart';
import 'package:world_kitchen/domain/entities/meal_detail.dart';
import 'package:world_kitchen/domain/usecases/get_meal_detail_usecase.dart';

class MealDetailProvider extends ChangeNotifier {
  final GetMealDetailUseCase getMealDetailUseCase;

  UiState<MealDetail> state = const UiState.loading();

  MealDetailProvider({required this.getMealDetailUseCase});

  Future<void> loadMealDetail(String id) async {
    state = const UiState.loading();
    notifyListeners();

    try {
      final meal = await getMealDetailUseCase(id);
      state = UiState.success(meal);
    } catch (e) {
      state = UiState.error(e.toString());
    }
    notifyListeners();
  }
}

