part of 'detail_cubit.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.movieDetailLoaded({
    required Movie movie,
    required List<Cast> casts,
  }) = _MovieDetailLoaded;
}
