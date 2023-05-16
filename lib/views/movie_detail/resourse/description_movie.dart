import 'package:flutter/material.dart';

class DescriptionMovie extends StatelessWidget {
  final String description;

  const DescriptionMovie({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Semantics(
          label:
              'Description', // Etiqueta de accesibilidad para la descripción de la película
          child: const Text(
            'Description',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Semantics(
          label:
              'Movie Description', // Etiqueta de accesibilidad para el texto de la descripción de la película
          child: Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
