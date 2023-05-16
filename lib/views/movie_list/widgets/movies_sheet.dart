import 'package:flutter/material.dart';
import 'package:movie_admin/utils/animation_page.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/view_models/movie_detail_model.dart';
import 'package:movie_admin/view_models/movie_list_model.dart';
import 'package:movie_admin/views/movie_detail/movie_detail.dart';
import 'package:movie_admin/widgets/network_image.dart';
import 'package:provider/provider.dart';

class MovieSheet extends StatelessWidget {
  const MovieSheet({
    super.key,
    required this.currentMovie,
    required this.rotationAngle,
  });

  final Search currentMovie;
  final double rotationAngle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MoviesListModel>(context, listen: false).updateInsert(false);
        Provider.of<MoviesDetailModel>(context, listen: false).clearValue();
        navigateTo(context, MovieDetail(imdbID: currentMovie.imdbID!));
      },
      child: Align(
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: rotationAngle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PNetworkImage(
                currentMovie.poster!,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  currentMovie.title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
