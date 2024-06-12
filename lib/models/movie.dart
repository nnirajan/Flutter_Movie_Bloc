import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_bloc/models/genre.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

// to run the build runner
// dart run build_runner build --delete-conflicting-outputs

@freezed
class Movie with _$Movie {
  // Added constructor. Must not have any parameter
  // for getters and methods to be added
  const Movie._();

  const factory Movie({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    List<Genre>? genres,
    int? runtime,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // getter method
  // get the lenght of the movie
  String get getLength {
    if (runtime != null) {
      final value = runtime!;

      int h, m;

      h = value ~/ 60;

      m = value % 60;

      String hourLeft = h.toString();

      String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

      String result = "${hourLeft}h ${minuteLeft}min";

      return result;
    }

    return "";
  }

  String get getLanguage {
    if (spokenLanguages != null) {
      final languages = spokenLanguages!;

      if (languages.isNotEmpty) {
        return languages.first.englishName;
      }
    }

    return "";
  }
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    required String name,
    @JsonKey(name: 'english_name') required String englishName,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
