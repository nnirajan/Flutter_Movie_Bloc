import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class GenreList with _$GenreList {
  const factory GenreList({
    required List<Genre> genres,
  }) = _GenreList;

  factory GenreList.fromJson(Map<String, dynamic> json) => _$GenreListFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
