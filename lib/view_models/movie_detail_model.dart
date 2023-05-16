import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';

class MoviesDetailModel with ChangeNotifier {
  Movie? _movie;

  Movie? get movie => _movie;

  void updateMovie(Movie newMovie) {
    _movie = newMovie;
    notifyListeners();
  }

  void clearValue() {
    _movie = null;
    notifyListeners();
  }

  
}
