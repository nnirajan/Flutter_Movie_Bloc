import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/base/bloc/base_bloc_state.dart';
import 'package:movie_bloc/models/cast.dart';
import 'package:movie_bloc/modules/detail/bloc/detail_cubit.dart';
import 'package:movie_bloc/modules/detail/bloc/detail_state.dart';
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
                  return _showMovieDetail(
                      pageState: pageState, context: context);
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

  Widget _showMovieDetail({
    required DetailState pageState,
    required BuildContext context,
  }) {
    return pageState.when(
      movieDetailLoaded: (movie, casts) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
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
                    children: [
                      const SizedBox(height: 44),
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_horiz_sharp),
                                  color: Colors.white,
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
                      padding: const EdgeInsets.all(24),
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
                                  style: const TextStyle(
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
                                    subTitle: movie.getLanguage,
                                    width: constraints.maxWidth / 3,
                                  ),
                                  // cannot show pg rating view
                                  // _getMovieDetail(
                                  //   title: "Rating",
                                  //   subTitle: "subTitle",
                                  //   width: constraints.maxWidth / 3,
                                  // ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            movie.overview,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Cast",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              shrinkWrap: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: casts.length,
                              itemBuilder: (context, index) {
                                final cast = casts[index];

                                return _getCastColumn(cast: cast);
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

  Widget _getCastColumn({required Cast cast}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            SizedBox(
              height: 72,
              width: 72,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://image.tmdb.org/t/p/w300/${cast.profilePath}",
                  placeholder: (context, url) {
                    return const Center(
                      child: SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Center(
                      child: SizedBox(
                        child: Image.asset('assets/images/default.png'),
                      ),
                    );
                  },
                ),
              ),
            ),
            Text(
              cast.name,
              maxLines: 2,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
