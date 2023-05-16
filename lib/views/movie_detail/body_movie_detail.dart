
import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/description_movie.dart';
import 'package:movie_admin/views/movie_detail/resourse/deparment_movie.dart';

import 'package:movie_admin/views/movie_detail/widget/arrow_back.dart';



import 'resourse/data_movie.dart';
import 'resourse/poster_movie.dart';
import 'resourse/rating_movie.dart';
import 'resourse/title_movie.dart';

class Detail extends StatelessWidget {
  final Movie movie;
  const Detail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            PosterMovie(poster: movie.poster!),
            const ArrowBack(),
          ],
        ),
        Transform.translate(
          offset: const Offset(
              0, -80), // Valor negativo para mover el Container hacia arriba
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TitleMovie(movie: movie),
                DescriptionMovie(description: movie.plot!),
                DataMovie(movie: movie),
                DepartmentMovie(movie: movie),
                RatingsWidget(ratings: movie.ratings!),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
