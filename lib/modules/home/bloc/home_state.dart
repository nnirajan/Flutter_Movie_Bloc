part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;

  final List<Genre> genres;

  final List<Movie> nowShowings;

  final List<Movie> popularMovies;

  final String? errorMessage;

  const HomeState({
    this.isLoading = true,
    required this.genres,
    required this.nowShowings,
    required this.popularMovies,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        isLoading,
        genres,
        nowShowings,
        popularMovies,
        errorMessage,
      ];

  HomeState copyWith({
    bool? isLoading,
    List<Genre>? genres,
    List<Movie>? nowShowings,
    List<Movie>? popularMovies,
    String? errorMessage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      genres: genres ?? this.genres,
      nowShowings: nowShowings ?? this.nowShowings,
      popularMovies: popularMovies ?? this.popularMovies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
