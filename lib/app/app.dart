import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/modules/home/bloc/home_bloc.dart';
import 'package:movie_bloc/modules/home/presentation/home_screen.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';
import 'package:movie_bloc/modules/movie_list/movie_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Movie",
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: Colours.scaffoldBgColor,
      // ),
      // home: BlocProvider(
      //   create: (context) =>
      //       HomeBloc(movieRepository: MovieRepositoryImpl())..fetchInitial(),
      //   child: const HomeScreen(),
      // ),
      home: MovieList(),
    );
  }
}
