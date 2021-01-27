import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main() {
  testWidgets('Check correct rating, language and release date', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: RatingReleaseLang(
            voteAverage: 8.3,
            originalLanguage: "en",
            releaseDate: "2019-04-24",
          ),
        ),
      ),
    ));

    expect(find.byKey(ValueKey('voteAverage')), findsOneWidget);
    expect(find.byKey(ValueKey('language')), findsOneWidget);
    expect(find.byKey(ValueKey('releaseDate')), findsOneWidget);
  });
}
