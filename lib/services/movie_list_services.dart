import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/services/api_utils.dart';
import 'package:movie_admin/utils/constants.dart' as globals;
import 'package:movie_admin/utils/functions.dart';
import 'package:movie_admin/view_models/movie_list_model.dart';
import 'package:provider/provider.dart';

class MovieListServices {

  static Future<void> getData(BuildContext context) async {

    String url = 'https://www.omdbapi.com/?apikey=${globals.apiKey}&s=movie';

    try {
      // Código que puede generar una excepción
      final response = await fetchResponse(url);
      Movies movies = Movies.fromJson(response);
      List<Search> listSearch = movies.search!;
      if (context.mounted) {
        Provider.of<MoviesListModel>(context, listen: false)
            .updateMovies(listSearch);
      }
    } catch (e) {
      // Manejo de la excepción
      showSnackBar(context: context, content: e.toString());
    }
  }

}
