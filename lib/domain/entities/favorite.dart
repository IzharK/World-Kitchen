import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';

/// Favorite meal entity
@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    required String id,
    required String name,
    required String image,
    required String area,
  }) = _Favorite;
}

