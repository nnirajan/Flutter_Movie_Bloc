import 'package:movie_bloc/models/genre.dart';
import 'package:movie_bloc/models/movie.dart';
import 'package:movie_bloc/models/movie_list.dart';
import 'package:movie_bloc/network/network_client.dart';

part 'movie_repository_impl.dart';

abstract class MovieRepository {
  Future<MovieList> getNowShowings(int page);

  Future<MovieList> getPopularMovies(int page);

  Future<Movie> getMovieDetail(int id);

  Future<List<Genre>> getGenres();
}
