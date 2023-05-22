import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/services/api_utils.dart';
import 'package:movie_admin/utils/constants.dart';
import 'package:movie_admin/view_models/movie_detail_model.dart';
import 'package:provider/provider.dart';

class MovieDetailServices {

  static Future<void> getData(BuildContext context, String imdbID) async {
    String url = movieDetailURL + imdbID;

    final response = await fetchResponse(url);
    Movie movieObtained = Movie.fromJson(response);
    if (context.mounted) {
      Provider.of<MoviesDetailModel>(context, listen: false)
          .updateMovie(movieObtained);
    }
  }
}