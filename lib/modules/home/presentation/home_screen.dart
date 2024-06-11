import 'package:flutter/material.dart';
import 'package:movie_bloc/modules/detail/detail_screen.dart';
import 'package:movie_bloc/modules/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_bloc/modules/home/presentation/widgets/now_showing_column.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/popular_row.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';

class HomeScreen extends StatelessWidget {
  // final HomeBloc _bloc = HomeBloc(movieRepository: MovieRepositoryImpl())
  //   ..fetchInitial();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("The Movie App"),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            final AlertDialog alert = AlertDialog(
              title: const Text("Error"),
              content: Text(state.errorMessage!),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"),
                )
              ],
            );

            showDialog(context: context, builder: (context) => alert);
          }
        },
        // bloc: _bloc,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                // _bloc.fetchInitial();
                context.read<HomeBloc>().fetchInitial();
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.nowShowings.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          "Now Showing",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 284,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.nowShowings.length,
                          itemBuilder: (context, index) {
                            final nowShowing = state.nowShowings[index];

                            return NowShowingColumn(
                              nowShowing: nowShowing,
                              onTapped: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return DetailScreen(id: nowShowing.id);
                                  },
                                ));
                              },
                            );
                          },
                        ),
                      ),
                    ],

                    // We can also implement if condition as follows
                    // if (state.nowShowings.isNotEmpty) _getNowShowing(state),

                    if (state.popularMovies.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                          "Popular",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.popularMovies.length,
                        itemBuilder: (context, index) {
                          final popularMovie = state.popularMovies[index];

                          return PopularRow(popularMovie: popularMovie);
                        },
                      ),
                    ],
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _getNowShowing(HomeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Text(
            "Now Showing",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 284,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.nowShowings.length,
            itemBuilder: (context, index) {
              final nowShowing = state.nowShowings[index];

              return NowShowingColumn(
                nowShowing: nowShowing,
                onTapped: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
