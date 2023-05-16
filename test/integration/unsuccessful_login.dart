import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_admin/main.dart';


void unsuccessfulLogin() {
  
  testWidgets('Login form should perform unsuccessful login', (WidgetTester tester) async {
    // Arrange
        await tester
        .pumpWidget(const MyApp());

    final emailField = find.byKey(const Key('email_field'));
    final passwordField = find.byKey(const Key('password_field'));
    final loginButton = find.byKey(const Key('login_button'));

    // Act
    await tester.enterText(emailField, 'dummy@example.com');
    await tester.enterText(passwordField, '12345');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Assert
    final snackbar = find.byType(SnackBar);

    expect(snackbar, findsOneWidget);

    // Buscar el widget de texto dentro del AlertDialog
    final errorText = find.descendant(
      of: snackbar,
      matching: find.text('Invalid credentials'),
    );

    // Verificar si el texto de error está presente dentro del AlertDialog
    expect(errorText, findsOneWidget);
  });

}