import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_bloc/models/cast.dart';
import 'package:movie_bloc/models/movie.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.movieDetailLoaded({
    required Movie movie,
    required List<Cast> casts,
  }) = _MovieDetailLoaded;
}
