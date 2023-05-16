import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/utils/functions.dart';
import 'package:movie_admin/views/movie_detail/widget/container_genre_movies.dart';

class TitleMovie extends StatelessWidget {
  const TitleMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    List<String> listGenre = separateWords(movie.genre!);

    List<Widget> containerGenre = listGenre.map((palabra) {
      return Flexible(child: ContainerGenreMovie(genre: palabra));
    }).toList();

    return Container(
      width: MediaQuery.of(context).size.width / 0.3,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            label:
                'Movie Title', // Etiqueta de accesibilidad para el título de la película
            child: Text(
              movie.title!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 24.0),
                    Semantics(
                      label:
                          'IMDb Rating', // Etiqueta de accesibilidad para la calificación de IMDb
                      value: '${movie.imdbRating!}/10',
                      child: Text('${movie.imdbRating!}/10'),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Semantics(
                  label:
                      'Movie Rated', // Etiqueta de accesibilidad para la clasificación de la película
                  child: Text('Restricted: ${movie.rated}'),
                ),
              ),
              Flexible(child: Text('${movie.released}')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Semantics(
                label:
                    'IMDb Votes', // Etiqueta de accesibilidad para los votos de IMDb
                child: Text(
                  'Votes ${movie.imdbVotes!}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: Text('Duration: ${movie.runtime!}'),
              ),
              Flexible(
                child: Text(' ${movie.type!}'),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(children: containerGenre),
        ],
      ),
    );
  }
}
