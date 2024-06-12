import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/models/genre.dart';
import 'package:movie_bloc/models/movie.dart';
import 'package:movie_bloc/modules/home/bloc/home_bloc.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/genre_widget.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/rating_view.dart';

class PopularRow extends StatelessWidget {
  final Movie popularMovie;

  final Function() onTapped;

  const PopularRow({
    required this.popularMovie,
    required this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<Genre> selectedGenres = [];

        if (popularMovie.genreIds != null) {
          for (var id in popularMovie.genreIds!) {
            final value = state.genres.firstWhere((genre) => genre.id == id);

            if (selectedGenres.length < 3) {
              selectedGenres.add(value);
            }
          }
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 120,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  onTapped();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      // width: 86,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500/${popularMovie.posterPath}",
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            popularMovie.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          RatingView(rating: popularMovie.voteAverage),
                          const SizedBox(height: 6),
                          Row(children: [
                            for (var genre in selectedGenres)
                              GenreWidget(genre: genre),
                          ]),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
