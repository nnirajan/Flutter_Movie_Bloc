import 'package:movie_bloc/base/bloc/base_bloc_state.dart';
import 'package:movie_bloc/base/bloc/base_cubit.dart';
import 'package:movie_bloc/models/cast.dart';
import 'package:movie_bloc/models/movie.dart';
import 'package:movie_bloc/modules/detail/bloc/detail_state.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';

class DetailCubit extends BaseCubit<DetailState> {
  final MovieRepository _movieRepository;

  late Movie _movie;
  List<Cast> _casts = [];

  DetailCubit({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const BaseBlocState.init());

  void fetchInitialData({required int id}) async {
    emit(const BaseBlocState.loading());

    try {
      List<Future<dynamic>> futures = [
        _movieRepository.getMovieDetail(id),
        _movieRepository.getMovieCasts(id),
      ];

      // Wait for all API calls to complete
      List<dynamic> results = await Future.wait(futures);

      _movie = results[0];

      _casts = results[1];

      emit(BaseBlocState.next(
        DetailState.movieDetailLoaded(movie: _movie, casts: _casts),
      ));
    } catch (error) {
      emit(BaseBlocState.error(Exception(error)));
    }
  }

  // void fetchMovieDetail({required int id}) async {
  //   emit(const BaseBlocState.loading());

  //   _movieRepository.getMovieDetail(id).then((movie) {
  //     _movie = movie;
  //     _movieDetailObtained();
  //   }).catchError((error) {
  //     emit(BaseBlocState.error(error));
  //   });
  // }

  // void fetchMovieCasts({required int id}) async {
  //   _movieRepository.getMovieCasts(id).then((casts) {
  //     _casts = casts;
  //     _movieDetailObtained();
  //   }).catchError((error) {
  //     emit(BaseBlocState.error(error));
  //   });
  // }

  // void _movieDetailObtained() {
  //   emit(BaseBlocState.next(
  //     DetailState.movieDetailLoaded(movie: _movie, casts: _casts),
  //   ));
  // }
}
