import 'package:flutter/material.dart';
import 'package:movie_bloc/models/movie.dart';
import 'package:movie_bloc/modules/detail/detail_screen.dart';
import 'package:movie_bloc/modules/home/presentation/widgets/popular_row.dart';
import 'package:movie_bloc/modules/movie_list/widgets/movie_list_row.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListRow(
              movie: Movie(
                id: 1,
                title: "title",
                overview: "overview",
                posterPath: "posterPath",
                backdropPath: "backdropPath",
                voteAverage: 1.5,
              ),
              onTapped: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) {
                //     return DetailScreen(id: 1);
                //   },
                // ));
              },
            );
          },
        ),
      ),
    );
  }
}
