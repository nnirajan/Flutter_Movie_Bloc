import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/models/genre.dart';
import 'package:movie_bloc/models/movie.dart';
import 'package:movie_bloc/modules/home/bloc/home_bloc.dart';

import 'package:movie_bloc/modules/home/presentation/widgets/genre_widget.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/rating_view.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/timer_view.dart';

class PopularRow extends StatelessWidget {
  final Movie popularMovie;

  final List<Genre> genres;

  const PopularRow({
    required this.popularMovie,
    required this.genres,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<Genre> selectedGenres = [];

        if (popularMovie.genreIds != null) {
          for (var id in popularMovie.genreIds!) {
            // final value = state.genres.map((genre) {
            //   if (genre.id == id) return genre;
            //   // return genres;
            // }).toList();

            // final value = state.genres.firstWhere((genre) => genre.id == id);

            final value = genres.firstWhere((genre) => genre.id == id);

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
                  print("tapped");
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                      width: 86,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          const TimerView(),
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
