import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_admin/services/dummy_backend.dart';
import 'package:movie_admin/view_models/auth_model.dart';

import 'package:movie_admin/views/login/resourse/header_login.dart';
import 'package:movie_admin/views/login/widgets/button_login.dart';
import 'package:movie_admin/views/login/widgets/text_field_login.dart';
import 'package:provider/provider.dart';

import '../../utils/functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String txtLogin = 'Login';

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Simulamos una llamada a la API de inicio de sesión
      final response =
          await loginRequest(_emailController.text, _passwordController.text);

      if (context.mounted) {
        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);

          if (validApiResponse(context, jsonResponse)) {
            Provider.of<AuthViewModel>(context, listen: false).login();
          }
        } else {
          showSnackBar(context: context, content: 'Request Failed');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const HeaderLoginPage(),
            const SizedBox(height: 30),
            TextFieldLogin(
              key: const Key('email_field'),
              textEditingController: _emailController,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              icon: Icons.email,
              semanticLabel: "Email Field",
              validator: (value) {
                // Expresión regular para validar un correo electrónico
                RegExp emailRegex = RegExp(
                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

                if (value!.isEmpty) {
                  return 'Enter your email';
                } else if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFieldLogin(
              key: const Key('password_field'),
              textEditingController: _passwordController,
              hintText: "Password",
              textInputType: TextInputType.text,
              icon: Icons.lock,
              semanticLabel: 'Password Field',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            ButtonLogin(
              key: const Key('login_button'),
              textLogin: txtLogin,
              onPressed: submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
