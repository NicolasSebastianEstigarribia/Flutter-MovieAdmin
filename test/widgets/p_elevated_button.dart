import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_admin/widgets/elevated_button.dart';

void pElevatedButtonTest() {
  testWidgets(
    'PElevatedButton should show the text and icon with given properties',
    (WidgetTester tester) async {
      // Arrange
      const text = 'Test Button';
      const icon = Icons.add;
      onPressed() => print('Button Pressed!');
      const width = 200.0;
      const height = 60.0;
      const orientacion = OrientacionIcono.horizontal;
      const iconoSize = 24.0;
      const textSize = 18.0;
      const posicionIcono = PosicionIcono.inicio;
      const borderRadius = 20.0;
      const estiloTexto = TextStyle(color: Colors.white);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PElevatedButton(
              text: text,
              icon: icon,
              onPressed: onPressed,
              width: width,
              height: height,
              orientacion: orientacion,
              iconoSize: iconoSize,
              textSize: textSize,
              posicionIcono: posicionIcono,
              borderRadius: borderRadius,
              estiloTexto: estiloTexto,
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(text), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        onPressed,
      );


      expect(
        tester.widget<Column>(find.byType(Column)).children.length,
        1,
      );

      final textWidget = tester.widget<Text>(find.text(text));
      expect(textWidget.style?.color, estiloTexto.color);

    },
  );
}
