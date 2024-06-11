// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CastResponseImpl _$$CastResponseImplFromJson(Map<String, dynamic> json) =>
    _$CastResponseImpl(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CastResponseImplToJson(_$CastResponseImpl instance) =>
    <String, dynamic>{
      'cast': instance.cast,
    };

_$CastImpl _$$CastImplFromJson(Map<String, dynamic> json) => _$CastImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$CastImplToJson(_$CastImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
    };
