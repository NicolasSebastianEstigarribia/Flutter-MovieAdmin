import 'package:flutter/material.dart';
import 'package:movie_admin/view_models/movie_list_model.dart';
import 'package:provider/provider.dart';


class FloatingMovieList extends StatelessWidget {
  const FloatingMovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesListModel>(builder: (context, viewModel, child) {
      return viewModel.insert
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    viewModel.updateInsert(!viewModel.insert);
                  },
                  child: const Icon(Icons.save),
                ),
                const SizedBox(height: 5),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    viewModel.updateInsert(!viewModel.insert);
                  },
                  child: const Icon(Icons.cancel),
                ),
              ],
            )
          : FloatingActionButton(
              onPressed: () {
                viewModel.updateInsert(!viewModel.insert);
              },
              child: const Icon(Icons.add),
            );
    });
  }
}
