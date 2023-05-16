import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/widgets/clip_path.dart';

class HeaderLoginPage extends StatelessWidget {
  const HeaderLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Movie Admin Header', // Etiqueta de accesibilidad para el encabezado
      child: Stack(
        children: <Widget>[
          PClipPath(
            clipper: WaveClipper2(),
            colors: const [
              Color.fromARGB(33, 58, 143, 255),
              Color.fromARGB(33, 73, 176, 254),
            ],
          ),
          PClipPath(
            clipper: WaveClipper3(),
            colors: const [
              Color.fromARGB(68, 58, 114, 255),
              Color.fromARGB(68, 73, 133, 254),
            ],
          ),
          PClipPath(
            clipper: WaveClipper1(),
            colors: const [
              lightBlue,
              darkBlue,
            ],
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 40,
                ),
                Icon(
                  Icons.movie,
                  color: primaryColor,
                  size: 60,
                  semanticLabel: 'Movie Icon', // Etiqueta de accesibilidad para el ícono
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Movies",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
