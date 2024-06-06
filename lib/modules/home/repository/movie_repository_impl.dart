part of 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final NetworkClientManageable _networkClient = NetworkClient.singleton;

  @override
  Future<MovieList> getNowShowings(int page) async {
    return _getMovieList('now_playing', page);
  }

  @override
  Future<MovieList> getPopularMovies(int page) async {
    return _getMovieList('popular', page);
  }

  Future<MovieList> _getMovieList(String url, int page) async {
    final Map<String, dynamic> queryParameters = {
      'language': 'en-US',
      'page': page,
    };

    final response = await _networkClient.getRequest(
      path: "movie/$url",
      queryParameters: queryParameters,
    );

    final movieList = MovieList.fromJson(response.data);

    return movieList;
  }

  @override
  Future<Movie> getMovieDetail(int id) async {
    final response = await _networkClient.getRequest(path: "movie/$id");

    final movieList = Movie.fromJson(response.data);

    return movieList;
  }

  @override
  Future<List<Genre>> getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }
}
