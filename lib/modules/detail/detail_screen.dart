import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/base/bloc/base_bloc_state.dart';
import 'package:movie_bloc/modules/detail/detail_bloc/detail_cubit.dart';
import 'package:movie_bloc/modules/detail/detail_bloc/detail_state.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/genre_widget.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/rating_view.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DetailCubit(movieRepository: MovieRepositoryImpl());
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<DetailCubit>().fetchInitialData(id: id);
            return;
          },
          child: BlocBuilder<DetailCubit, BaseBlocState<DetailState>>(
            builder: (context, state) {
              return state.when(
                init: () {
                  context.read<DetailCubit>().fetchInitialData(id: id);
                  return const SizedBox.shrink();
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                next: (pageState) {
                  return _showMovieDetail(pageState);
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
      ),
    );
  }

  Widget _showMovieDetail(DetailState pageState) {
    return pageState.when(
      movieDetailLoaded: (movie, casts) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                  placeholder: (context, url) {
                    return const Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 280),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // textBaseline: TextBaseline.alphabetic,
                            children: [
                              Expanded(
                                child: Text(
                                  movie.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.bookmark_border_sharp),
                              )
                            ],
                          ),
                          const SizedBox(height: 6),
                          RatingView(rating: movie.voteAverage),
                          const SizedBox(height: 10),
                          if (movie.genres != null)
                            Row(
                              children: [
                                for (var genre in movie.genres!)
                                  GenreWidget(genre: genre),
                              ],
                            ),
                          const SizedBox(height: 10),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _getMovieDetail(
                                    title: "Length",
                                    subTitle: movie.getLength,
                                    width: constraints.maxWidth / 3,
                                  ),
                                  _getMovieDetail(
                                    title: "Language",
                                    subTitle: "subTitle",
                                    width: constraints.maxWidth / 3,
                                  ),
                                  _getMovieDetail(
                                    title: "Rating",
                                    subTitle: "subTitle",
                                    width: constraints.maxWidth / 3,
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            movie.overview,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Cast",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            // width: 72,
                            height: 110,
                            child: ListView.builder(
                              shrinkWrap: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 72,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 72,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Tom Holland",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _getMovieDetail({
    required String title,
    required String subTitle,
    required double width,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 2),
          Text(subTitle),
        ],
      ),
    );
  }
}
