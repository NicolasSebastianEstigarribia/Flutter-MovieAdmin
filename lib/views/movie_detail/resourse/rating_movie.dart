import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';

class RatingsWidget extends StatelessWidget {
  final List<Rating> ratings;

  const RatingsWidget({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: 'Calificaciones',
          child: const Text(
            'Ratings',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ratings.map((rating) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Semantics(
                  label: rating.source,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      rating.source!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Semantics(
                  label: rating.value,
                  child: Text(rating.value!),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
