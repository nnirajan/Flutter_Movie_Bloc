import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/base/bloc/base_bloc_state.dart';
import 'package:movie_bloc/modules/detail/detail_screen.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';
import 'package:movie_bloc/modules/movie_list/bloc/movie_list_cubit.dart';
import 'package:movie_bloc/modules/movie_list/bloc/movie_list_state.dart';
import 'package:movie_bloc/modules/movie_list/widgets/movie_list_row.dart';

class MovieListScreen extends StatelessWidget {
  final MovieType movieType;

  const MovieListScreen({super.key, required this.movieType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MovieListCubit(movieRepository: MovieRepositoryImpl());
      },
      child: const MovieListScaffold(),
    );
  }
}

class MovieListScaffold extends StatefulWidget {
  const MovieListScaffold({
    super.key,
  });

  @override
  State<MovieListScaffold> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScaffold> {
  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;

    final currentScroll = _scrollController.offset;

    return currentScroll == maxScroll;
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MovieListCubit>().getMovieList();
        },
        child: BlocBuilder<MovieListCubit, BaseBlocState<MovieListState>>(
          builder: (context, state) {
            return state.when(
              initial: () {
                context.read<MovieListCubit>().getMovieList();
                return const SizedBox.shrink();
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              loaded: (pageState) {
                return pageState.when(
                  moviesObtained: (movies, hasReachedMax) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: movies.length,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
        
                              return ListRow(
                                movie: movie,
                                onTapped: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return DetailScreen(id: movie.id);
                                    },
                                  ));
                                },
                              );
                            },
                          ),
                        ),
        
                        // TODO: need logic to show bottom loader
                      ],
                    );
                  },
                );
              },
              error: (error) {
                return Center(
                  child: Text("Something went wrong: ${error.toString()}"),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<MovieListCubit>().getMovieList(fetchInitialData: false);
    }
  }
}
