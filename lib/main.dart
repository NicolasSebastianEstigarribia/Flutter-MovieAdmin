import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_admin/view_models/auth_model.dart';
import 'package:movie_admin/view_models/movie_detail_model.dart';

import 'package:movie_admin/view_models/movie_list_model.dart';
import 'package:movie_admin/views/login/login_page.dart';

import 'package:provider/provider.dart';

import 'views/movie_list/movie_list.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesListModel()),
        ChangeNotifierProvider(create: (_) => MoviesDetailModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Admin',
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          textTheme: GoogleFonts.ubuntuTextTheme(),
        ),
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, child) {
            if (authViewModel.isAuthenticated) {
              // usuario autenticado, muestra la pantalla principal
              return const MovieList();
            } else {
              // usuario no autenticado, muestra la pantalla de login
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
