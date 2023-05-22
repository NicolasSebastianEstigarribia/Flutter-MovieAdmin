import 'package:flutter/material.dart';

// 
const String apiKey = '14fd113c';

// API
String movieListURL = 'https://www.omdbapi.com/?apikey=$apiKey&s=movie';
String movieDetailURL = 'https://www.omdbapi.com/?apikey=$apiKey&i='; // + imdbID



//Colors
const darkBlue = Color(0x44007acc);
const lightBlue = Color.fromRGBO(0, 149, 246, 1);
const primaryColor = Colors.white;
const secondaryColor = Colors.grey;