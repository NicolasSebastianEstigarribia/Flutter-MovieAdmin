import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_admin/widgets/clip_path.dart';

void pClipPath() {
  testWidgets(
    'PClipPath displays child widget with given clipper and colors',
    (WidgetTester tester) async {
      // Arrange
      final clipper = WaveClipper1();
      final colors = [Colors.red, Colors.blue];
      final child = Container(); // Widget hijo de prueba
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PClipPath(
              clipper: clipper,
              colors: colors,
              child: child,
            ),
          ),
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.byWidget(child), findsOneWidget);
      expect(find.byType(ClipPath), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.decoration == BoxDecoration(
                gradient: LinearGradient(colors: colors),
              ),
          description: 'Container with correct decoration',
        ),
        findsOneWidget,
      );
      expect(
        tester
            .widget<ClipPath>(find.byType(ClipPath))
            .clipper,
        equals(clipper),
      );
    },
  );
}
