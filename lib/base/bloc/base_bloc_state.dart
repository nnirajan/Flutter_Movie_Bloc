import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_bloc_state.freezed.dart';

@freezed
class BaseBlocState<T> with _$BaseBlocState<T> {
  const factory BaseBlocState.initial() = _Initial;

  const factory BaseBlocState.loading() = _Loading;

  const factory BaseBlocState.loaded(T data) = _Loaded<T>;

  const factory BaseBlocState.error(Exception error) = _Error;
}
