// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailState {
  Movie get movie => throw _privateConstructorUsedError;
  List<Cast> get casts => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie, List<Cast> casts) movieDetailLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie, List<Cast> casts)? movieDetailLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie, List<Cast> casts)? movieDetailLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieDetailLoaded value) movieDetailLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MovieDetailLoaded value)? movieDetailLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MovieDetailLoaded value)? movieDetailLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStateCopyWith<DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<$Res> {
  factory $DetailStateCopyWith(
          DetailState value, $Res Function(DetailState) then) =
      _$DetailStateCopyWithImpl<$Res, DetailState>;
  @useResult
  $Res call({Movie movie, List<Cast> casts});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class _$DetailStateCopyWithImpl<$Res, $Val extends DetailState>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? casts = null,
  }) {
    return _then(_value.copyWith(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      casts: null == casts
          ? _value.casts
          : casts // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieDetailLoadedImplCopyWith<$Res>
    implements $DetailStateCopyWith<$Res> {
  factory _$$MovieDetailLoadedImplCopyWith(_$MovieDetailLoadedImpl value,
          $Res Function(_$MovieDetailLoadedImpl) then) =
      __$$MovieDetailLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Movie movie, List<Cast> casts});

  @override
  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$MovieDetailLoadedImplCopyWithImpl<$Res>
    extends _$DetailStateCopyWithImpl<$Res, _$MovieDetailLoadedImpl>
    implements _$$MovieDetailLoadedImplCopyWith<$Res> {
  __$$MovieDetailLoadedImplCopyWithImpl(_$MovieDetailLoadedImpl _value,
      $Res Function(_$MovieDetailLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? casts = null,
  }) {
    return _then(_$MovieDetailLoadedImpl(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      casts: null == casts
          ? _value._casts
          : casts // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
    ));
  }
}

/// @nodoc

class _$MovieDetailLoadedImpl implements _MovieDetailLoaded {
  const _$MovieDetailLoadedImpl(
      {required this.movie, required final List<Cast> casts})
      : _casts = casts;

  @override
  final Movie movie;
  final List<Cast> _casts;
  @override
  List<Cast> get casts {
    if (_casts is EqualUnmodifiableListView) return _casts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_casts);
  }

  @override
  String toString() {
    return 'DetailState.movieDetailLoaded(movie: $movie, casts: $casts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailLoadedImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            const DeepCollectionEquality().equals(other._casts, _casts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, movie, const DeepCollectionEquality().hash(_casts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailLoadedImplCopyWith<_$MovieDetailLoadedImpl> get copyWith =>
      __$$MovieDetailLoadedImplCopyWithImpl<_$MovieDetailLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie, List<Cast> casts) movieDetailLoaded,
  }) {
    return movieDetailLoaded(movie, casts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie, List<Cast> casts)? movieDetailLoaded,
  }) {
    return movieDetailLoaded?.call(movie, casts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie, List<Cast> casts)? movieDetailLoaded,
    required TResult orElse(),
  }) {
    if (movieDetailLoaded != null) {
      return movieDetailLoaded(movie, casts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieDetailLoaded value) movieDetailLoaded,
  }) {
    return movieDetailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MovieDetailLoaded value)? movieDetailLoaded,
  }) {
    return movieDetailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MovieDetailLoaded value)? movieDetailLoaded,
    required TResult orElse(),
  }) {
    if (movieDetailLoaded != null) {
      return movieDetailLoaded(this);
    }
    return orElse();
  }
}

abstract class _MovieDetailLoaded implements DetailState {
  const factory _MovieDetailLoaded(
      {required final Movie movie,
      required final List<Cast> casts}) = _$MovieDetailLoadedImpl;

  @override
  Movie get movie;
  @override
  List<Cast> get casts;
  @override
  @JsonKey(ignore: true)
  _$$MovieDetailLoadedImplCopyWith<_$MovieDetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
