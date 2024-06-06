part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchInitial() = _FetchInitial;
  const factory HomeEvent.fetchGenres() = _FetchGenres;
  const factory HomeEvent.fetchNowShowings() = _FetchNowShowings;
  const factory HomeEvent.fetchPopularMovies() = _FetchPopularMovies;
}
