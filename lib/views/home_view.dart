import 'package:flutter/material.dart';
import 'package:progetto_movie/viewmodels/movie_view_models.dart';
import 'package:progetto_movie/views/component/movie_form_dialog.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieViewModels>().fetchMovies();
    });
    return Scaffold(
      appBar: AppBar(title: Text('Movie Collection App'), centerTitle: true),
      body: Consumer<MovieViewModels>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.movies.isEmpty) {
            return const Center(
              child: Text(
                'Non hai aggiunto film',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            );
          }
          return const Text('verrà sostituito dalla lista dei film');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => MovieFormDialog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
