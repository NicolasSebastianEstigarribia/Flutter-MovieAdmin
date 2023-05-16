import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/functions.dart';

Future<http.Response> loginRequest(String username, String password) {
  // Comprueba si el usuario y la contraseña son válidos
  if (username == 'dummy@example.com' && password == '123') {
    // Respuesta JSON exitosa
    final jsonResponse = {
      'sts': 1,
      'msg': 'Valid credentials',
      'token': 'ABC123',
    };

    return Future.delayed(const Duration(seconds: 2), () {
      return http.Response(json.encode(jsonResponse), 200);
    });
  } else {
    // Respuesta JSON de error
    final errorResponse = {
      'sts': 0,
      'msg': 'Invalid credentials',
    };

    return Future.delayed(const Duration(seconds: 2), () {
      return http.Response(json.encode(errorResponse), 200);
    });
  }
}

bool validApiResponse(BuildContext context, dynamic json) {
  if (json['sts'] == 0) {
    showSnackBar( context : context, content: json['msg']);
    return false;
  } else {
    return true;
  }
}

