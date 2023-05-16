
import 'package:flutter/material.dart';

String getApiKey() {
  return "14fd113c";
}

List<String> separateWords(String str) {
  if (str.isEmpty) {
    return [];
  }
  return str.split(",").map((palabra) => palabra.trim()).toList();
}

List<Text> textString(List<String> string) {
  return string.map((palabra) {
    return Text(palabra);
  }).toList();
}

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
