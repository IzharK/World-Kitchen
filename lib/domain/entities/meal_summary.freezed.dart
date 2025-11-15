// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MealSummary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealSummaryCopyWith<MealSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealSummaryCopyWith<$Res> {
  factory $MealSummaryCopyWith(
    MealSummary value,
    $Res Function(MealSummary) then,
  ) = _$MealSummaryCopyWithImpl<$Res, MealSummary>;
  @useResult
  $Res call({String id, String name, String image});
}

/// @nodoc
class _$MealSummaryCopyWithImpl<$Res, $Val extends MealSummary>
    implements $MealSummaryCopyWith<$Res> {
  _$MealSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? image = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealSummaryImplCopyWith<$Res>
    implements $MealSummaryCopyWith<$Res> {
  factory _$$MealSummaryImplCopyWith(
    _$MealSummaryImpl value,
    $Res Function(_$MealSummaryImpl) then,
  ) = __$$MealSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String image});
}

/// @nodoc
class __$$MealSummaryImplCopyWithImpl<$Res>
    extends _$MealSummaryCopyWithImpl<$Res, _$MealSummaryImpl>
    implements _$$MealSummaryImplCopyWith<$Res> {
  __$$MealSummaryImplCopyWithImpl(
    _$MealSummaryImpl _value,
    $Res Function(_$MealSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? image = null}) {
    return _then(
      _$MealSummaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$MealSummaryImpl implements _MealSummary {
  const _$MealSummaryImpl({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'MealSummary(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealSummaryImplCopyWith<_$MealSummaryImpl> get copyWith =>
      __$$MealSummaryImplCopyWithImpl<_$MealSummaryImpl>(this, _$identity);
}

abstract class _MealSummary implements MealSummary {
  const factory _MealSummary({
    required final String id,
    required final String name,
    required final String image,
  }) = _$MealSummaryImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get image;

  /// Create a copy of MealSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealSummaryImplCopyWith<_$MealSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
