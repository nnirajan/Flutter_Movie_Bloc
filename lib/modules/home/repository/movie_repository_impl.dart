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

    final movie = Movie.fromJson(response.data);

    return movie;
  }

  @override
  Future<List<Cast>> getMovieCasts(int id) async {
    final response = await _networkClient.getRequest(path: "movie/$id/credits");

    final CastResponse castResponse = CastResponse.fromJson(response.data);

    return castResponse.cast;
  }

  @override
  Future<List<Genre>> getGenres() async {
    final response = await _networkClient.getRequest(path: "genre/movie/list");

    final genreResponse = GenreList.fromJson(response.data);

    return genreResponse.genres;
  }
}
