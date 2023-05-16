import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';

class MoviesListModel with ChangeNotifier {
  bool _insert = false;
  final List<Search> _movies = <Search>[];

  List<Search> get movies => _movies;
  bool get insert => _insert;

  void updateInsert(bool isInsert) {
    _insert = isInsert;
    notifyListeners();
  }

  void updateMovies(List<Search> newMovies) {
    _movies.addAll(newMovies);
    notifyListeners();
  }

  void insertMovie(Search newMovie) {
    _movies.add(newMovie);
    notifyListeners();
  }

  void deleteMovie(String imdbIdToRemove) {
    _movies.removeWhere((search) => search.imdbID == imdbIdToRemove);
    notifyListeners();
  }
}
