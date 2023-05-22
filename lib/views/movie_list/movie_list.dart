import 'package:flutter/material.dart';
import 'package:movie_admin/services/movie_list_services.dart';
import 'package:movie_admin/view_models/auth_model.dart';
import 'package:movie_admin/view_models/movie_list_model.dart';

import 'package:movie_admin/utils/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

import 'resourse/animated_list_view.dart';
import 'floating_movie_list.dart';


class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    MovieListServices.getData(context);
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Consumer<MoviesListModel>(
          builder: (context, viewModel, child) {
            return (viewModel.movies.isNotEmpty)
                ? AnimateListView(movies: viewModel.movies)
                : const SpinnerWidget();
          },
        ),
        floatingActionButton: const FloatingMovieList());
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Movies',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: Provider.of<AuthViewModel>(context, listen: false).logout,
      ),
      centerTitle: true,
      elevation: 0.3,
    );
  }
}
