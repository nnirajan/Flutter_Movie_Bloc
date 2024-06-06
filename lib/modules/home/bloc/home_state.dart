part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;

  final List<Movie> nowShowings;

  final List<Movie> popularMovies;

  const HomeState({
    this.isLoading = true,
    required this.nowShowings,
    required this.popularMovies,
  });

  @override
  List<Object?> get props => [isLoading, nowShowings, popularMovies];

  HomeState copyWith({
    bool? isLoading,
    List<Movie>? nowShowings,
    List<Movie>? popularMovies,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      nowShowings: nowShowings ?? this.nowShowings,
      popularMovies: popularMovies ?? this.popularMovies,
    );
  }
}
