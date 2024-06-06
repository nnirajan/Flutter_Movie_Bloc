import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_bloc/models/movie.dart';

import 'package:movie_bloc/modules/home/repository/movie_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieRepository _movieRepository;

  HomeBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const HomeState(nowShowings: [], popularMovies: [])) {
    on<_FetchInitial>(_fetchInitial);

    on<_FetchNowShowings>(_fetchNowShowings);

    on<_FetchPopularMovies>(_fetchPopularMovies);
  }

  Future<void> _fetchInitial(
    _FetchInitial event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    var responses = await Future.wait([
      _movieRepository.getNowShowings(1),
      _movieRepository.getPopularMovies(1),
    ]);

    final nowShowings = responses[0].results;

    final popularMovies = responses[1].results;

    emit(state.copyWith(
      isLoading: false,
      nowShowings: nowShowings,
      popularMovies: popularMovies,
    ));
  }

  Future<void> _fetchNowShowings(
    _FetchNowShowings event,
    Emitter<HomeState> emit,
  ) async {
    await _movieRepository.getNowShowings(1);
  }

  Future<void> _fetchPopularMovies(
    _FetchPopularMovies event,
    Emitter<HomeState> emit,
  ) async {
    await _movieRepository.getPopularMovies(1);
  }
}
