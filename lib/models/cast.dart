import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@freezed
class CastResponse with _$CastResponse {
  const factory CastResponse({
    required List<Cast> cast,
  }) = _CastResponse;

  factory CastResponse.fromJson(Map<String, dynamic> json) =>
      _$CastResponseFromJson(json);
}

@freezed
class Cast with _$Cast {
  const factory Cast({
    required int id,
    required String name,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
