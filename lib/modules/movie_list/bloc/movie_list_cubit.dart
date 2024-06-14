import 'package:movie_bloc/base/bloc/base_bloc_state.dart';
import 'package:movie_bloc/base/bloc/base_cubit.dart';
import 'package:movie_bloc/models/movie.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';
import 'package:movie_bloc/modules/movie_list/bloc/movie_list_state.dart';

enum MovieType {
  nowShowings,
  popular;
}

class MovieListCubit extends BaseCubit<MovieListState> {
  final MovieRepository _movieRepository;

  final MovieType _movieType;

  int _page = 1;

  List<Movie> _movies = [];

  bool _hasReachedMax = false;

  MovieListCubit({
    required MovieRepository movieRepository,
    MovieType movieType = MovieType.nowShowings,
  })  : _movieRepository = movieRepository,
        _movieType = movieType,
        super(const BaseBlocState.initial());

  Future<void> getMovieList({
    bool fetchInitialData = true,
    bool refreshData = false,
  }) async {
    state.whenOrNull(
      loading: () {
        return;
      },
      loaded: (data) {
        if (data.hasReachedMax) {
          return;
        }
      },
    );

    if (fetchInitialData) {
      emit(const BaseBlocState.loading());

      _page = 1;

      _movies = [];
    } else {
      ++_page;
    }

    switch (_movieType) {
      case MovieType.nowShowings:
        _getNowShowings();

      case MovieType.popular:
        _getPopularMovies();
    }
  }

  void _getNowShowings() async {
    try {
      final nowPlayings = await _movieRepository.getNowShowings(_page);

      _movies += nowPlayings.results;

      _hasReachedMax = !(_movies.length < nowPlayings.totalResults);

      _moviesObtained();
    } catch (error) {
      emit(BaseBlocState.error(Exception(error.toString())));
    }
  }

  void _getPopularMovies() async {
    try {
      final popularMovies = await _movieRepository.getPopularMovies(_page);

      _movies += popularMovies.results;

      _hasReachedMax = !(_movies.length < popularMovies.totalResults);

      _moviesObtained();
    } catch (error) {
      emit(BaseBlocState.error(Exception(error.toString())));
    }
  }

  void _moviesObtained() {
    emit(BaseBlocState.loaded(
      MovieListState.moviesObtained(
        movies: _movies,
        hasReachedMax: _hasReachedMax,
      ),
    ));
  }
}
