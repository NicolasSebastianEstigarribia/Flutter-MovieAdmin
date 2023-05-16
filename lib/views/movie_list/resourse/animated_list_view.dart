import 'package:flutter/material.dart';
import 'package:movie_admin/models/movies.dart';
import 'package:movie_admin/views/movie_list/widgets/movies_sheet.dart';
import 'package:movie_admin/widgets/network_image.dart';

class AnimateListView extends StatefulWidget {
  final List<Search> movies;

  const AnimateListView({Key? key, required this.movies}) : super(key: key);

  @override
  State<AnimateListView> createState() => _AnimateListViewState();
}

class _AnimateListViewState extends State<AnimateListView> {
  final PageController _pageController =
      PageController(initialPage: 5, viewportFraction: 0.7);

  int currentPageIndex = 1;
  dynamic provider;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        currentPageIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        final currentMovie = widget.movies[index];
        final isLeftImage = index == currentPageIndex - 1;
        final isRightImage = index == currentPageIndex + 1;

        final rotationAngle = isLeftImage ? -0.1 : (isRightImage ? 0.1 : 0.0);

        return Stack(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Opacity(
                opacity: 0.5,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: PNetworkImage(
                    currentMovie.poster!,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0,
                  -80), // Valor negativo para mover el Container hacia arriba

              child: MovieSheet(
                currentMovie: currentMovie,
                rotationAngle: rotationAngle,
              ),
            ),
          ],
        );
      },
      onPageChanged: (int index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
