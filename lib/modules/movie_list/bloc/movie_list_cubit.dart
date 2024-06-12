import 'package:movie_bloc/base/bloc/base_bloc_state.dart';
import 'package:movie_bloc/base/bloc/base_cubit.dart';
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

  MovieListCubit({
    required MovieRepository movieRepository,
    MovieType movieType = MovieType.nowShowings,
  })  : _movieRepository = movieRepository,
        _movieType = movieType,
        super(const BaseBlocState.init());

  void getMovieList({bool fetchInitialData = true}) {
    // MovieListState.hasReachedMax ;

    if (fetchInitialData) {
      emit(const BaseBlocState.loading());
      _page = 1;
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

      final movies = nowPlayings.results;

      // BaseBlocState.next(MovieListState.copyWith)

      emit(BaseBlocState.next(
          MovieListState.moviesObtained(movies: movies, hasReachedMax: false)));
    } catch (error) {
      emit(BaseBlocState.error(Exception(error.toString())));
    }
  }

  void _getPopularMovies() async {
    // final nowPlayings = await _movieRepository.getNowShowings(_page);
  }
}
