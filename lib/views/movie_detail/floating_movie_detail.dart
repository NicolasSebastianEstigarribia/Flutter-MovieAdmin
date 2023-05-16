import 'package:flutter/material.dart';
import 'package:movie_admin/view_models/movie_list_model.dart';
import 'package:provider/provider.dart';

class PFloatingButton extends StatefulWidget {
  final String imdbIdToRemove;
  const PFloatingButton({super.key, required this.imdbIdToRemove});

  @override
  State<PFloatingButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PFloatingButton> {
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _hideMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (_overlayEntry == null) {
          _showMenu();
        } else {
          _hideMenu();
        }
      },
      child: const Icon(Icons.more_vert),
    );
  }

  void _showMenu() {
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          right: 0,
          bottom: 60,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _hideMenu();
                      Provider.of<MoviesListModel>(context, listen: false)
                          .deleteMovie(widget.imdbIdToRemove);
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  const SizedBox(height: 5),
                  FloatingActionButton(
                    onPressed: () {
                      _hideMenu();
                    },
                    child: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
