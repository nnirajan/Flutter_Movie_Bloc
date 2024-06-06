import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc/models/genre.dart';

import 'package:movie_bloc/models/movie.dart';

import 'package:movie_bloc/modules/home/repository/movie_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   final MovieRepository _movieRepository;

//   HomeBloc({required MovieRepository movieRepository})
//       : _movieRepository = movieRepository,
//         super(const HomeState(
//           genres: [],
//           nowShowings: [],
//           popularMovies: [],
//         )) {
//     on<_FetchInitial>(_fetchInitial);

//     on<_FetchNowShowings>(_fetchNowShowings);

//     on<_FetchPopularMovies>(_fetchPopularMovies);
//   }

//   Future<void> _fetchInitial(
//     _FetchInitial event,
//     Emitter<HomeState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));

//     var responses = await Future.wait([
//       _movieRepository.getNowShowings(1),
//       _movieRepository.getPopularMovies(1),
//       // _movieRepository.getGenres(),
//     ]);

//     final nowShowings = responses[0].results;

//     final popularMovies = responses[1].results;

//     emit(state.copyWith(
//       isLoading: false,
//       nowShowings: nowShowings,
//       popularMovies: popularMovies,
//     ));
//   }

//   Future<void> _fetchNowShowings(
//     _FetchNowShowings event,
//     Emitter<HomeState> emit,
//   ) async {
//     await _movieRepository.getNowShowings(1);
//   }

//   Future<void> _fetchPopularMovies(
//     _FetchPopularMovies event,
//     Emitter<HomeState> emit,
//   ) async {
//     await _movieRepository.getPopularMovies(1);
//   }
// }

class HomeBloc extends Cubit<HomeState> {
  final MovieRepository _movieRepository;

  HomeBloc({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const HomeState(
          genres: [],
          nowShowings: [],
          popularMovies: [],
        ));

  Future<void> fetchInitial() async {
    emit(state.copyWith(isLoading: true));

    final responses = await Future.wait([
      _fetchNowShowings(),
      _fetchPopularMovies()
      // _movieRepository.getGenres(),
    ]);

    final nowShowings = responses[0];

    final popularMovies = responses[1];

    emit(state.copyWith(
      isLoading: false,
      genres: [],
      nowShowings: nowShowings,
      popularMovies: popularMovies,
    ));
  }

  Future<List<Movie>> _fetchNowShowings() async {
    try {
      var response = await _movieRepository.getNowShowings(1);

      return response.results;
    } catch (error) {
      emit(state.copyWith(errorMessage: error.toString()));

      return [];
    }
  }

  Future<List<Movie>> _fetchPopularMovies() async {
    try {
      var response = await _movieRepository.getPopularMovies(1);

      return response.results;
    } catch (error) {
      emit(state.copyWith(errorMessage: error.toString()));

      return [];
    }
  }
}
