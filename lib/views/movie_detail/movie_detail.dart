import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';
import 'package:movie_admin/services/api_utils.dart';
import 'package:movie_admin/utils/functions.dart';
import 'package:movie_admin/view_models/movie_detail_model.dart';
import 'package:movie_admin/views/movie_detail/body_movie_detail.dart';
import 'package:movie_admin/views/movie_detail/floating_movie_detail.dart';
import 'package:movie_admin/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  final String imdbID;

  const MovieDetail({Key? key, required this.imdbID}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    String apiKey = getApiKey();
    String url = 'https://www.omdbapi.com/?apikey=$apiKey&i=${widget.imdbID}';

    final response = await fetchResponse(url);
    Movie movieObtained = Movie.fromJson(response);
    if (context.mounted) {
      Provider.of<MoviesDetailModel>(context, listen: false)
          .updateMovie(movieObtained);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesDetailModel>(
      builder: (context, viewModel, child) {
        return viewModel.movie != null
            ? Scaffold(
                body: Detail(movie: viewModel.movie!),
                floatingActionButton: PFloatingButton(
                  imdbIdToRemove: viewModel.movie!.imdbID!,
                ),
              )
            : const Scaffold(body: SpinnerWidget());
      },
    );
  }
}
