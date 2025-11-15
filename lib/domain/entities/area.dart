import 'package:freezed_annotation/freezed_annotation.dart';

part 'area.freezed.dart';

/// Area entity representing a country/region for meals
@freezed
class Area with _$Area {
  const factory Area({
    required String name,
  }) = _Area;
}

