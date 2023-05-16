import 'package:flutter/material.dart';
import 'package:movie_admin/models/movie.dart';

class DataMovie extends StatelessWidget {
  const DataMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        alignedRow(
          widgets: [
            flexibleInfoColumn(title: 'Language', info: movie.language!),
            flexibleInfoColumn(title: 'Country', info: movie.country!),
            flexibleInfoColumn(title: 'Metascore', info: movie.metascore!),
          ],
        ),
        alignedRow(
          widgets: [
            flexibleInfoColumn(title: 'DVD', info: movie.dVD!),
            flexibleInfoColumn(title: 'BoxOffice', info: movie.boxOffice!),
            flexibleInfoColumn(title: 'Website', info: movie.website!),
          ],
        ),
        alignedRow(
          widgets: [
            flexibleInfoColumn(title: 'Awards', info: movie.awards!),
            flexibleInfoColumn(title: 'Production', info: movie.production!),
          ],
        ),
      ],
    );
  }

  Expanded flexibleInfoColumn({required String title, required String info}) {
    return Expanded(
      child: Semantics(
        label: title,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Semantics(
                label: info,
                child: Text(info),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget alignedRow({required List<Widget> widgets}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgets,
      ),
    );
  }
}
