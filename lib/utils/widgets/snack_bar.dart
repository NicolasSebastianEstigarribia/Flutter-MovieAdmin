import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String content,
  int? duracion,
}) {
  duracion = duracion ?? 1000; //Si es nulo pone 1000 milisegundos por defecto
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: Duration(milliseconds: duracion),
  ));
}
