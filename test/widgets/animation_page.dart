import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_admin/utils/animation_page.dart';

void animationPageWidgetTest() {


  testWidgets('navigateTo pushes FadePageRoute', (WidgetTester tester) async {
    // Arrange
    final targetPage = Container(); // Página de destino de prueba
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return TextButton(
              onPressed: () {
                navigateTo(context, targetPage);
              },
              child: const Text('Go to Target Page'),
            );
          },
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              builder: (context) => Container(),
              settings: settings,
            );
          }
          return null;
        },
        navigatorKey: navigatorKey,
      ),
    );

    // Act
    await tester.tap(find.text('Go to Target Page'));
    await tester.pumpAndSettle();

    // Assert
    expect(navigatorKey.currentState!.canPop(), isTrue);
    expect(find.byWidget(targetPage), findsOneWidget);
  });

}
