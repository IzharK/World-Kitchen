import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

/// Generic UI state for handling loading, success, and error states
@freezed
sealed class UiState<T> with _$UiState<T> {
  const factory UiState.loading() = _Loading<T>;
  const factory UiState.success(T data) = _Success<T>;
  const factory UiState.error(String message) = _Error<T>;
}

