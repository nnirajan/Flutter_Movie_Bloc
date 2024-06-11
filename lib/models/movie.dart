import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_bloc/models/genre.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

// to run the build runner
// dart run build_runner build --delete-conflicting-outputs

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    List<Genre>? genres,
    String? runTime,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
