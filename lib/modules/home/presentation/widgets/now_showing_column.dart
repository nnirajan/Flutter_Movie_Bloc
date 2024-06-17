import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc/models/movie.dart';

import 'package:movie_bloc/modules/home/presentation/widgets/rating_view.dart';

class NowShowingColumn extends StatelessWidget {
  final Movie nowShowing;

  final Function() onTapped;

  const NowShowingColumn({
    super.key,
    required this.nowShowing,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 144,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            onTapped();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 212,
                width: 144,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500${nowShowing.posterPath}",
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                maxLines: 2,
                nowShowing.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              RatingView(rating: nowShowing.voteAverage),
            ],
          ),
        ),
      ),
    );
  }
}
