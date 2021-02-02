import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main() {
  Widget _buildWidget(String overview) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MovieOverview(
            overview: overview,
          ),
        ),
      ),
    );
  }

  group('Movie overview test', () {
    testWidgets('Check when movie overview is not empty', (WidgetTester tester) async {
      await tester.pumpWidget(_buildWidget(
          "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, "
          "Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and "
          "restore order to the universe once and for all, no matter what consequences may be in store."));

      expect(find.byKey(ValueKey('overviewTitle')), findsOneWidget);
      expect(find.byKey(ValueKey('overviewNotEmpty')), findsOneWidget);
    });

    testWidgets('Check when movie overview is empty', (WidgetTester tester) async {
      await tester.pumpWidget(_buildWidget(""));

      expect(find.byKey(ValueKey('overviewTitle')), findsOneWidget);
      expect(find.byKey(ValueKey('overviewEmpty')), findsOneWidget);
    });
  });
}
