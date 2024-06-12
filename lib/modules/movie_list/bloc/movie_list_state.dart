import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_bloc/models/movie.dart';

part 'movie_list_state.freezed.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.moviesObtained({
    required List<Movie> movies,
    @Default(false) bool hasReachedMax,
  }) = _MoviesObtained;
}
