import 'package:json_annotation/json_annotation.dart';
import 'package:world_kitchen/domain/entities/area.dart';

part 'area_dto.g.dart';

@JsonSerializable()
class AreaDto {
  @JsonKey(name: 'strArea')
  final String strArea;

  AreaDto({required this.strArea});

  factory AreaDto.fromJson(Map<String, dynamic> json) =>
      _$AreaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AreaDtoToJson(this);

  Area toEntity() => Area(name: strArea);
}

