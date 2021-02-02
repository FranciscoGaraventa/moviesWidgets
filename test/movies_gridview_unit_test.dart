import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_widgets_package/movies_widgets_package.dart';

void main() {
  testWidgets('Show movie card individualy', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: MoviesGridView(
            movieList: [
              Movie(
                id: 542047,
                originalTitle: "Greenland",
                title: "Greenland",
                backdropPath: 'https://image.tmdb.org/t/p/w780/2Fk3AB8E9dYIBc2ywJkxk8BTyhc.jpg',
              ),
              Movie(
                id: 529203,
                originalTitle: "The Croods: A New Age",
                title: "The Croods: A New Age",
                backdropPath: 'https://image.tmdb.org/t/p/w780/tK1zy5BsCt1J4OzoDicXmr0UTFH.jpg',
              ),
              Movie(
                id: 299534,
                originalTitle: "Avengers: Endgame",
                title: "Avengers: Endgame",
                backdropPath: 'https://image.tmdb.org/t/p/w780/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg',
              ),
            ],
          ),
        ),
      ),
    ));

    int length = 3;
    for (int i = 0; i < length; i++) {
      expect(find.byKey(ValueKey('movieCard' + '_$i')), findsOneWidget);
    }
  });
}
