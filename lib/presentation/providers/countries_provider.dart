import 'package:flutter/material.dart';
import 'package:world_kitchen/core/util/ui_state.dart';
import 'package:world_kitchen/domain/entities/area.dart';
import 'package:world_kitchen/domain/usecases/get_areas_usecase.dart';

class CountriesProvider extends ChangeNotifier {
  final GetAreasUseCase getAreasUseCase;

  UiState<List<Area>> state = const UiState.loading();

  CountriesProvider({required this.getAreasUseCase}) {
    loadAreas();
  }

  Future<void> loadAreas() async {
    state = const UiState.loading();
    notifyListeners();

    try {
      final areas = await getAreasUseCase();
      state = UiState.success(areas);
    } catch (e) {
      state = UiState.error(e.toString());
    }
    notifyListeners();
  }
}

