import 'package:flutter/material.dart';
import 'package:progetto_movie/viewmodels/movie_view_models.dart';
import 'package:progetto_movie/views/component/movie_card.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieViewModels>();
    final movies = viewModel.movies;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(movie: movie);
            },
          ),
        ),
      ],
    );
  }
}
