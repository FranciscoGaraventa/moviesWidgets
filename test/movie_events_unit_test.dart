import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main() {
  Widget _buildWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: child,
        ),
      ),
    );
  }

  group('Movie posible events [initial, error, empty] test', () {
    testWidgets('Initial state with successful show message', (WidgetTester tester) async {
      await tester.pumpWidget(_buildWidget(MovieEventInitial(
        initialMessage: 'INITIAL MESSAGE',
      )));

      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byKey(ValueKey('initialMessage')), findsOneWidget);
    });

    testWidgets('Error state with successful show message', (WidgetTester tester) async {
      await tester.pumpWidget(_buildWidget(MovieEventError(
        messageError: 'ERROR MESSAGE',
      )));

      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byKey(ValueKey('errorMessage')), findsOneWidget);
    });

    testWidgets('Error state with successful show message', (WidgetTester tester) async {
      await tester.pumpWidget(_buildWidget(MovieEventEmpty(
        icon: Icons.search_off,
        messageEmpty: 'NO RESULT FOUND',
      )));

      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byKey(ValueKey('emptyMessage')), findsOneWidget);
    });
  });
}
