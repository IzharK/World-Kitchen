import 'package:flutter/material.dart';
import 'package:world_kitchen/core/util/ui_state.dart';
import 'package:world_kitchen/domain/entities/meal_summary.dart';
import 'package:world_kitchen/domain/usecases/get_meals_by_area_usecase.dart';

class RecipesProvider extends ChangeNotifier {
  final GetMealsByAreaUseCase getMealsByAreaUseCase;

  UiState<List<MealSummary>> state = const UiState.loading();

  RecipesProvider({required this.getMealsByAreaUseCase});

  Future<void> loadMealsByArea(String area) async {
    state = const UiState.loading();
    notifyListeners();

    try {
      final meals = await getMealsByAreaUseCase(area);
      state = UiState.success(meals);
    } catch (e) {
      state = UiState.error(e.toString());
    }
    notifyListeners();
  }
}

