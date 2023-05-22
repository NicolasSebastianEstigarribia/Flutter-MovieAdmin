
import 'package:flutter/material.dart';

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

