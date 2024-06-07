import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/modules/detail/detail_screen.dart';
import 'package:movie_bloc/modules/home/bloc/home_bloc.dart';
import 'package:movie_bloc/modules/home/presentation/home_screen.dart';
import 'package:movie_bloc/modules/home/repository/movie_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Movie",
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: Colours.scaffoldBgColor,
      // ),
      home: BlocProvider(
        create: (context) =>
            HomeBloc(movieRepository: MovieRepositoryImpl())..fetchInitial(),
        child: HomeScreen(),
      ),

      // home: DetailScreen(),
    );
  }
}
