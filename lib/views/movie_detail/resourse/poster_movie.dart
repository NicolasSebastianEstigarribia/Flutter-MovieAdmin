import 'package:flutter/material.dart';
import 'package:movie_admin/widgets/network_image.dart';

class PosterMovie extends StatelessWidget {
  const PosterMovie({
    super.key,
    required this.poster,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      child: PNetworkImage(
        poster,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
      ),
    );
  }
}
