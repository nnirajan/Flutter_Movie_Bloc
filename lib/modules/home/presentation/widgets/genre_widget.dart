import 'package:flutter/material.dart';
import 'package:movie_bloc/models/genre.dart';

class GenreWidget extends StatelessWidget {
  final Genre genre;

  const GenreWidget({
    required this.genre,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
        ),
        height: 20,
        // color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            genre.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
