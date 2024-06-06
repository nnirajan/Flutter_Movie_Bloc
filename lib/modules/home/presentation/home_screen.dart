import 'package:flutter/material.dart';
import 'package:movie_bloc/modules/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_bloc/modules/home/presentation/widgets/now_showing_column.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/popular_row.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';

class HomeScreen extends StatelessWidget {
  final HomeBloc _bloc = HomeBloc(movieRepository: MovieRepositoryImpl())
    ..add(const HomeEvent.fetchInitial());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("The Movie App"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                      itemBuilder: (context, index) => NowShowingColumn(
                        onTapped: () {},
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text(
                      "Popular",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.popularMovies.length,
                    itemBuilder: (context, index) => const PopularRow(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
